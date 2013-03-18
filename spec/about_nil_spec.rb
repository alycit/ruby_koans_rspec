require "spec_helper"

describe "Nil" do

  it "should show that nil is an object" do
    nil.is_a?(Object).should == __
  end

  it "should not cause null pointer errors when calling methods on nil" do
    # What happens when you call a method that doesn't exist.  The
    # following begin/rescue/end code block captures the exception and
    # makes some assertions about it.
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      # What exception has been caught?
      ex.class.should == __

      # What message was attached to the exception?
      # (HINT: replace __ with part of the error message.)
      ex.message.should =~ /__/
    end
  end

  it "should display methods nil has defined for it" do
    nil.nil?.should eq __
    nil.to_s.should eq __
    nil.inspect.should eq __

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
  end

end