require 'spec_helper'

describe "Message Passing" do

  class MessageCatcher
    def caught?
      true
    end
  end

  it "should demonstrate methods_can_be_called_directly" do
    mc = MessageCatcher.new

    expect(mc.caught?).to be_true
  end

  it "should demonstrate methods_can_be_invoked_by_sending_the_message" do
    mc = MessageCatcher.new

    expect(mc.send(:caught?)).to be_true
  end

  it "should demonstrate methods_can_be_invoked_more_dynamically" do
    mc = MessageCatcher.new

    expect(mc.send("caught?")).to be_true
    expect(mc.send("caught" + __)).to be_true # What do you need to add to the first string?
    expect(mc.send("CAUGHT?".____)).to be_true  # What would you need to do to the string?
  end

  it "should demonstrate send_with_underscores_will_also_send_messages" do
    mc = MessageCatcher.new

    mc.__send__(:caught?).should eql __

    # THINK ABOUT IT:
    #
    # Why does Ruby provide both send and __send__ ?
  end

  it "should demonstrate classes_can_be_asked_if_they_know_how_to_respond" do
    mc = MessageCatcher.new

    mc.respond_to?(:caught?).should eql __
    mc.respond_to?(:does_not_exist).should eql __
  end

  # ------------------------------------------------------------------

  class MessageCatcher
    def add_a_payload(*args)
      args
    end
  end

  it "should demonstrate sending_a_message_with_arguments" do
    mc = MessageCatcher.new

    mc.add_a_payload.should eql __
    mc.send(:add_a_payload).should eql __

    mc.add_a_payload(3, 4, nil, 6).should eql __
    mc.send(:add_a_payload, 3, 4, nil, 6).should eql __
  end

  # ------------------------------------------------------------------

  class TypicalObject
  end

  it "should demonstrate sending_undefined_messages_to_a_typical_object_results_in_errors" do
    typical = TypicalObject.new

    expect{ typical.foobar }.to raise_error(__, /__/)

  end

  it "should demonstrate calling_method_missing_causes_the_no_method_error" do
    typical = TypicalObject.new

    expect{ typical.method_missing(:foobar) }.to raise_error(__, /__/)


    # THINK ABOUT IT:
    #
    # If the method :method_missing causes the NoMethodError, then
    # what would happen if we redefine method_missing?
    #
    # NOTE:
    #
    # In Ruby 1.8 the method_missing method is public and can be
    # called as shown above.  However, in Ruby 1.9 the method_missing
    # method is private.  We explicitly made it public in the testing
    # framework so this example works in both versions of Ruby.  Just
    # keep in mind you can't call method_missing like that in Ruby
    # 1.9. normally.
    #
    # Thanks.  We now return you to your regularly scheduled Ruby
    # Koans.
  end

  # ------------------------------------------------------------------

  class AllMessageCatcher
    def method_missing(method_name, *args, &block)
      "Someone called #{method_name} with <#{args.join(", ")}>"
    end
  end

  it "should demonstrate all_messages_are_caught" do
    catcher = AllMessageCatcher.new

    catcher.foobar.should eql __
    catcher.foobaz(1).should eql __
    catcher.sum(1, 2, 3, 4, 5, 6).should eql __
  end

  it "should demonstrate catching_messages_makes_respond_to_lie" do
    catcher = AllMessageCatcher.new

    expect(catcher.any_method).should_not raise_error(__)
    catcher.respond_to?(:any_method).should eql __
  end

  # ------------------------------------------------------------------

  class WellBehavedFooCatcher
    def method_missing(method_name, *args, &block)
      if method_name.to_s[0, 3] == "foo"
        "Foo to you too"
      else
        super(method_name, *args, &block)
      end
    end
  end

  it "should demonstrate foo_method_are_caught" do
    catcher = WellBehavedFooCatcher.new

    catcher.foo_bar.should eql __
    catcher.foo_baz.should eql __
  end

  it "should demonstrate non_foo_messages_are_treated_normally" do
    catcher = WellBehavedFooCatcher.new

    expect(catcher.normal_undefined_method).to raise_error(__)
  end

  # ------------------------------------------------------------------

  # (note: just reopening class from above)
  class WellBehavedFooCatcher
    def respond_to?(method_name)
      if method_name.to_s[0, 3] == "foo"
        true
      else
        super(method_name)
      end
    end
  end

  it "should demonstrate explicitly_implementing_respond_to_lets_objects_tell_the_truth" do
    catcher = WellBehavedFooCatcher.new

    catcher.respond_to?(:foo_bar).should eql __
    catcher.respond_to?(:something_else).should eql __
  end
end