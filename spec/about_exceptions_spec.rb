require 'spec_helper'

describe "Exceptions" do

  class MySpecialError < RuntimeError
  end

  it "should demonstrate exceptions_inherit_from_Exception" do
    MySpecialError.ancestors[1].should eql __
    MySpecialError.ancestors[2].should eql __
    MySpecialError.ancestors[3].should eql __
    MySpecialError.ancestors[4].should eql __
  end

  it "should demonstrate rescue_clause" do
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      result = :exception_handled
    end

    result.should eql __

    ex.is_a?(StandardError).should eql(__), "Should be a Standard Error"
    ex.is_a?(RuntimeError).should eql(__), "Should be a Runtime Error"

    expect(RuntimeError.ancestors.include?(StandardError)).to be_true,
                                                              "RuntimeError is a subclass of StandardError"

    ex.message.should eql __
  end

  it "should demonstrate raising_a_particular_error" do
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, "My Message"
    rescue MySpecialError => ex
      result = :exception_handled
    end

    result.should eql __
    ex.message.should eql __
  end

  it "should demonstrate ensure_clause" do
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      # no code here
    ensure
      result = :always_run
    end

    result.should eql __
  end

  # Sometimes, we must know about the unknown
  it "should demonstrate asserting_an_error_is_raised" do
    # A do-end is a block, a topic to explore more later
    expect(raise MySpecialError.new("New instances can be raised directly.")).to raise_error(__)
  end
end