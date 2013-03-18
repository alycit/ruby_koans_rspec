require "rspec/core/formatters/base_formatter"

class KoansFormatter < RSpec::Core::Formatters::BaseFormatter

  PROGRESS_FILE_NAME = '.path_progress'

  def initialize(output)
    super(output)
    @passed_count = 0
    @observations = []
  end

  def example_passed(example)
    @passed_count += 1
    if @passed_count > progress.last.to_i
      @observations << green("About#{example.example_group.description}\##{example.description} has expanded your awareness")
    end
  end

  def example_failed(example)
    unless failed?
      @failure = example.exception
      add_progress(@passed_count)
      @observations << red("About#{example.example_group.description}\##{example.description} has damaged your karma.")
    end
    exit
  end

  def format_backtrace(backtrace, example)
    super(backtrace, example.metadata)
  end

  def start_dump
    if failed?
      @observations.each { |c| puts c }
      encourage
      guide_through_error
      a_zenlike_statement
      show_progress
    else
      end_screen
    end
  end

  def add_progress(prog)
    @_contents = nil
    exists = File.exists?(PROGRESS_FILE_NAME)
    File.open(PROGRESS_FILE_NAME, 'a+') do |f|
      f.print "#{',' if exists}#{prog}"
    end
  end

  def progress
    if @_contents.nil?
      if File.exists?(PROGRESS_FILE_NAME)
        File.open(PROGRESS_FILE_NAME, 'r') do |f|
          @_contents = f.read.to_s.gsub(/\s/, '').split(',')
        end
      else
        @_contents = []
      end
    end
    @_contents
  end

  def failed?
    !@failure.nil?
  end

  def assert_failed?
    @failure.is_a?(RSpec::Expectations::ExpectationNotMetError)
  end

  def encourage
    puts
    puts "The Master says:"
    puts cyan("  You have not yet reached enlightenment.")
    if ((recents = progress.last(5)) && recents.size == 5 && recents.uniq.size == 1)
      puts cyan("  I sense frustration. Do not be afraid to ask for help.")
    elsif progress.last(2).size == 2 && progress.last(2).uniq.size == 1
      puts cyan("  Do not lose hope.")
    elsif progress.last.to_i > 0
      puts cyan("  You are progressing. Excellent. #{progress.last} completed.")
    end
  end

  def guide_through_error
    puts
    puts "The answers you seek..."
    puts red(@failure.message)
    puts
    puts "Please meditate on the following code:"
    if assert_failed?
      puts embolden_first_line_only(indent(find_interesting_lines(@failure.backtrace)))
    else
      puts embolden_first_line_only(indent(@failure.backtrace))
    end
    puts
  end

  def a_zenlike_statement
    if !failed?
      zen_statement = "Mountains are again merely mountains"
    else
      zen_statement = case (@passed_count % 10)
                        when 0
                          "mountains are merely mountains"
                        when 1, 2
                          "learn the rules so you know how to break them properly"
                        when 3, 4
                          "remember that silence is sometimes the best answer"
                        when 5, 6
                          "sleep is the best meditation"
                        when 7, 8
                          "when you lose, don't lose the lesson"
                        else
                          "things are not what they appear to be: nor are they otherwise"
                      end
    end
    puts green(zen_statement)
  end

  def show_progress
    bar_width = 50
    scale = bar_width.to_f/@example_count
    print green("your path thus far [")
    happy_steps = (@passed_count*scale).to_i
    happy_steps = 1 if happy_steps == 0 && @passed_count > 0
    print green('.'*happy_steps)
    if failed?
      print red('X')
      print cyan('_'*(bar_width-1-happy_steps))
    end
    print green(']')
    print " #{@passed_count}/#{@example_count}"
    puts
  end

  def embolden_first_line_only(text)
    first_line = true
    text.collect { |t|
      if first_line
        first_line = false
        red(t)
      else
        cyan(t)
      end
    }
  end

  def indent(text)
    text = text.split(/\n/) if text.is_a?(String)
    text.collect { |t| "  #{t}" }
  end

  def find_interesting_lines(backtrace)
    backtrace.reject { |line|
      line =~ /rspec-expectations|rspec-core|bin/
    }
  end

  def end_screen
    "JRuby 1.9.x Koans"
    ruby_version = "(in #{'J' if defined?(JRUBY_VERSION)}Ruby #{defined?(JRUBY_VERSION) ? JRUBY_VERSION : RUBY_VERSION})"
    ruby_version = ruby_version.side_padding(54)
    completed = <<-ENDTEXT
                                  ,,   ,  ,,
                                :      ::::,    :::,
                   ,        ,,: :::::::::::::,,  ::::   :  ,
                 ,       ,,,   ,:::::::::::::::::::,  ,:  ,: ,,
            :,        ::,  , , :, ,::::::::::::::::::, :::  ,::::
           :   :    ::,                          ,:::::::: ::, ,::::
          ,     ,:::::                                  :,:::::::,::::,
      ,:     , ,:,,:                                       :::::::::::::
     ::,:   ,,:::,                                           ,::::::::::::,
    ,:::, :,,:::                                               ::::::::::::,
   ,::: :::::::,       Mountains are again merely mountains     ,::::::::::::
   :::,,,::::::                                                   ::::::::::::
 ,:::::::::::,                                                    ::::::::::::,
 :::::::::::,                                                     ,::::::::::::
:::::::::::::                                                     ,::::::::::::
::::::::::::                      Ruby Koans                       ::::::::::::,
::::::::::::#{                  ruby_version                     },::::::::::::,
:::::::::::,                                                      , ::::::::::::
,:::::::::::::,                brought to you by                 ,,::::::::::::,
::::::::::::::                                                    ,::::::::::::
 ::::::::::::::,                                                 ,:::::::::::::
 ::::::::::::,             EdgeCase Software Artisans           , ::::::::::::
  :,::::::::: ::::              Ported to rspec by              :::::::::::::
   ,:::::::::::  ,:                 @alycit                  ,,:::::::::::::,
     ::::::::::::                                           ,::::::::::::::,
      :::::::::::::::::,                                  ::::::::::::::::
       :::::::::::::::::::,                             ::::::::::::::::
        ::::::::::::::::::::::,                     ,::::,:, , ::::,:::
          :::::::::::::::::::::::,               ::,: ::,::, ,,: ::::
              ,::::::::::::::::::::              ::,,  , ,,  ,::::
                 ,::::::::::::::::              ::,, ,   ,:::,
                      ,::::                         , ,,
                                                  ,,,
    ENDTEXT
    puts magenta(completed)
  end

  protected

  def color(text, color_code)
    color_enabled? ? "#{color_code}#{text}\e[0m" : text
  end

  def red(text)
    color(text, "\e[31m")
  end

  def green(text)
    color(text, "\e[32m")
  end

  def cyan(text)
    color(text, "\e[36m")
  end

  def blue(text)
    color(text, "\e[34m")
  end

  def magenta(text)
    color(text, "\e[35m")
  end

end

class String
  def side_padding(width)
    extra = width - self.size
    if width < 0
      self
    else
      left_padding = extra / 2
      right_padding = (extra+1)/2
      (" " * left_padding) + self + (" " *right_padding)
    end
  end
end


