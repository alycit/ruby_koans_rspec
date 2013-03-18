require 'spec_helper'

describe "Arrays" do

  it 'should demonstrate array creation' do
    empty_array = Array.new
    empty_array.class.should eql __
    empty_array.size.should eql __
  end

  it "should demonstrate array literals" do
    array = Array.new
    array.should eql []

    array[0] = 1
    array.should eql [1]

    array[1] = 2
    array.should eql [1, __]

    array << 333
    array.should eql __
  end

  it "should demonstrate accessing array elements" do
    array = [:peanut, :butter, :and, :jelly]

    array[0].should eql __
    array.first.should eql __
    array[3].should eql __
    array.last.should eql __
    array[-1].should eql __
    array[-3].should eql __
  end

  it "should demonstrate slicing arrays" do
    array = [:peanut, :butter, :and, :jelly]

    array[0,1].should eql __
    array[0,2].should eql __
    array[2,2].should eql __
    array[2,20].should eql __
    array[4,0].should eql __
    array[4,100].should eql __
    array[5,0].should eql __
  end

  it "should show arrays and ranges" do
    array = [:peanut, :butter, :and, :jelly]

    (1..5).class.should eql __
    (1..5).should_not eql [1,2,3,4,5]
    (1..5).to_a.should eql __
    (1...5).to_a.should eql __
  end

  it "should demonstrate slicing with ranges" do
    array = [:peanut, :butter, :and, :jelly]

    array[0..2].should eql __
    array[0...2].should eql __
    array[2..-1].should eql __
  end

  it "should demonstrate pushing and popping arrays" do
    array = [1,2]
    array.push(:last)

    array.should eql __

    popped_value = array.pop
    popped_value.should eql __
    array.should eql __
  end

  it "should demonstrate shifting arrays" do
    array = [1,2]
    array.unshift(:first)

    array.should eql __

    shifted_value = array.shift
    shifted_value.should eql __
    array.should eql __
  end
end