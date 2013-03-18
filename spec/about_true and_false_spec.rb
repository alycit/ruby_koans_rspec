require 'spec_helper'

describe "True and False" do

  def truth_value(condition)
    if condition
      :true_stuff
    else
      :false_stuff
    end
  end

  it "should demonstrate true_is_treated_as_true" do
    truth_value(true).should eql __
  end

  it "should demonstrate false_is_treated_as_false" do
    truth_value(false).should eql __
  end

  it "should demonstrate nil_is_treated_as_false_too" do
    truth_value(nil).should eql __
  end

  it "should demonstrate everything_else_is_treated_as_true" do
    truth_value(1).should eql __
    truth_value(0).should eql __
    truth_value([]).should eql __
    truth_value({}).should eql __
    truth_value("Strings").should eql __
    truth_value("").should eql __
  end
end