require 'spec_helper'

describe "Objects" do

  it "should show that everything is an object" do
    1.is_a?(Object).should == __
    1.5.is_a?(Object).should == __
    "string".is_a?(Object).should == __
    nil.is_a?(Object).should == __
    Object.is_a?(Object).should == __
  end

  it "should convert objects to strings" do
    123.to_s.should eql __
    nil.to_s.should eql __
  end

  it "should be able to be inspected" do
    123.inspect.should eql __
    nil.inspect.should eql __
  end

  it "should show that objects have ids" do
    obj = Object.new
    obj.object_id.class.should == __
  end

  it "should create objects with different ids" do
    obj = Object.new
    another_obj = Object.new
    (obj.object_id != another_obj.object_id).should == __
  end

  it "should have the same object id for some system objects" do
    false.object_id.should == __
    true.object_id.should == __
    nil.object_id.should == __
  end

  it "should have fixed ids for small integers" do
    0.object_id.should == __
    1.object_id.should == __
    2.object_id.should == __
    100.object_id.should == __

    # THINK ABOUT IT:
    # What pattern do the object IDs for small integers follow?
  end

  it "should clone objects to create a different object" do
    obj = Object.new
    copy = obj.clone

    (obj != copy).should == __
    (obj.object_id != copy.object_id).should == __
  end
end