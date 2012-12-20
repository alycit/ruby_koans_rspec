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
    #puts "exiting example_started"
    #puts "==================="
  end

  def example_passed(example)
    #puts "==================="
    #puts "entering example_passed"
    #super(example)
    @passed_count += 1
    #puts "exiting example_passed"
    #puts "==================="
  end

  def example_pending(example)
    puts "==================="
    puts "entering example_pending"
    #super(example)
    @pending_count += 1
    puts "exiting example_pending"
    puts "==================="
  end

  def example_failed(example)
    #puts "==================="
    #puts "entering example_failed"
    #super(example)
    #puts example.description
    @failure_count += 1
    #puts "exiting example_failed"
    #puts "==================="
    exit
  end

  def message(message)
    #the system exit message from the example_failed exit line is reported through this method
    #puts "==================="
    #puts "entering message"
    #super(message)
    #puts "exiting message"
    #puts "==================="
  end

  def example_group_finished(example_group)
    #puts "==================="
    #puts "entering example_group_finished"
    super(example_group)
    #puts "exiting example_group_finished"
    #puts "==================="
  end

  def stop
    #puts "==================="
    #puts "entering stop"
    super
    #puts "exiting stop"
    #puts "==================="
  end

  def start_dump
    #puts "==================="
    #puts "entering start_dump"
    super
    output.puts "#{@passed_count} of #{@example_count} completed"
    #puts "exiting start_dump"
    #puts "==================="
  end

  def dump_pending
    #puts "==================="
    #puts "entering dump_pending"
    super
    #puts "exiting dump_pending"
    #puts "==================="
  end

  def dump_failures
    #puts "==================="
    #puts "entering dump_failures"
    #super
    #puts "exiting dump_failures"
    #puts "==================="
  end

  def dump_summary(duration, example_count, failure_count, pending_count)
    #puts "==================="
    #puts "entering dump_summary"
    #super(duration, example_count, failure_count, pending_count)
    #puts "exiting dump_summary"
    #puts "==================="
  end

  def summary_line(example_count, failure_count, pending_count)
    puts "==================="
    puts "entering summary_line"
    super(example_count, failure_count, pending_count)
    puts "exiting summary_line"
    puts "==================="
  end

  def colorise_summary(summary)
    puts "==================="
    puts "entering colorise_summary"
    super(summary)
    puts "exiting colorise_summary"
    puts "==================="
  end

  def dump_commands_to_rerun_failed_examples
    #shows the line that failed and the file it failed in
    puts "==================="
    puts "entering dump_commands_to_rerun_failed_examples"
    super
    puts "exiting dump_commands_to_rerun_failed_examples"
    puts "==================="
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
    #puts "==================="
    #puts "entering close"
    super
    #puts "exiting close"
    #puts "==================="
  end

end

#initialize
#- (Object) seed(number)
