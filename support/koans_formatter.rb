require "rspec/core/formatters/base_text_formatter"

class KoansFormatter < RSpec::Core::Formatters::BaseTextFormatter
  def initialize(output)
    #puts "==================="
    #puts "entering initialize"
    super(output)
    @passed_count = 0
    #puts "exiting initialize"
    #puts "==================="
  end

  def start(example_count)
    #puts "==================="
    #puts "entering start"
    super(example_count)
    #puts "exiting start"
    #puts "==================="
  end

  def example_group_started(example_group)
    #puts "================s==="
    #puts "entering example_group_started"
    super(example_group)
    #puts "exiting example_group_started"
    #puts "==================="
  end

  def example_started(example)
    #puts "==================="
    #puts "entering example_started"
    super(example)
    #puts "\t#{example.description}"
    #puts "exiting example_started"
    #puts "==================="
  end

  def example_passed(example)
    puts "About#{example.example_group.description}\##{example.description} has expanded your awareness"
    @passed_count += 1
  end

  def example_pending(example)
    @pending_count += 1
  end

  def example_failed(example)
    if caller.any?{|method| method.include? "run_examples"}
      puts red("About#{example.example_group.description}\##{example.description} has damaged your karma.")
    end
    @failure_count += 1
    exit
  end

  def message(message)
    #the system exit message from the example_failed exit line is reported through this method
    #super(message)
  end

  def example_group_finished(example_group)
    super(example_group)
  end

  def stop
    super
  end

  def start_dump
    super
    output.puts "#{@passed_count} of #{@example_count} completed"
  end

  def dump_pending
    super
  end

  def dump_failures
    super
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    #super(duration, example_count, failure_count, pending_count)
  end

  def summary_line(example_count, failure_count, pending_count)
    #called from dump_summary
    super(example_count, failure_count, pending_count)
  end

  def colorise_summary(summary)
    #called from dump_summary
    super(summary)
  end

  def dump_commands_to_rerun_failed_examples
    #shows the line that failed and the file it failed in
    super
  end

  def dump_profile
    puts "==================="
    puts "entering dump_profile"
    super
    puts "exiting dump_profile"
    puts "==================="
  end

  def format_backtrace(backtrace, example)
    puts "==================="
    puts "entering format_backtrace"
    super(backtrace, example)
    puts "exiting format_backtrace"
    puts "==================="
  end

  def close
    super
  end

end

#initialize
#- (Object) seed(number)
