require 'spec_helper'

describe "Matchers" do

  it "should allow matching with equality operator" do
    true.should == false
  end

  it "should allow matching with built in matchers" do
    true.should be_false
  end

  it "should allow matching with built in matchers and a message" do
    true.should_not be_true, "This should be false -- Please fix this"
  end

  it "should allow matching of variables" do
    expected_value = __
    actual_value = 1 + 1

    actual_value.should == expected_value
  end

  it "should allow matching of variables using a better way" do
    expected_value = __
    actual_value = 1 + 1

    actual_value.should eq(expected_value)
  end

  it "should allow matching of values using equality" do
    expected_value = __
    actual_value = 1 + 1

    actual_value.should eql(expected_value)
  end

  # We should all have our own unique identity
  it "should allow matching of identity using equality " do
    expected_value = "I should be something else"
    actual_value = expected_value

    actual_value.should_not equal(expected_value)
  end

  it "should allow matching near values" do
    2.should be_within(3).of(_n_)
  end

  #be_nil            - nil
  #be                - nil
  #exist             - nil

  #be_a              - objects
  #be_an_instance_of - objects

  #cover             - ranges

  #end_with          - string
  #have              - string
  #have_at_least     - string
  #have_at_most      - string
  #start_with        - string
  #include           - string

  #match             - regex

  #include           - arrays
  #match_array       - arrays

end