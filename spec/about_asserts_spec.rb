require 'spec_helper'

describe "Asserts" do

  it "does some stuff" do
    true.should == true
  end

  it "asserts truth" do
    true.should be_true
  end

  it "does other stuff" do
    2.should == 2
  end

end