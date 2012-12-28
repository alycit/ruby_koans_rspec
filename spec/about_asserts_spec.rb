require 'spec_helper'

describe "Asserts" do

  it "does some stuff" do
    true.should == __
  end

  it "asserts truth" do
    #might need to monkey patch matchers?
    true.should be_true
  end

  it "does other stuff" do
    2.should == __
  end

end