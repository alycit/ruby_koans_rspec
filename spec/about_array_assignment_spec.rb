require 'spec_helper'

describe "Array Assignment" do

  it 'should demonstrate non-parallel assignment' do
    names = ["John", "Smith"]
    names.should eql __
  end

  it 'should demonstrate parallel assignment' do
    first_name, last_name = ["John", "Smith"]
    first_name.should eql __
    last_name.should eql __
  end

  it 'should demonstrate parallel assignments with splat operator' do
    first_name, *last_name = ["John", "Smith", "III"]
    first_name.should eql __
    last_name.should eql __
  end

  it 'should demonstrate parallel assignments with too few variables' do
    first_name, last_name = ["Cher"]
    first_name.should eql __
    last_name.should eql __
  end

  it 'should demonstrate parallel assignments with subarrays' do
    first_name, last_name = [["Willie", "Rae"], "Johnson"]
    first_name.should eql __
    last_name.should eql __
  end

  it 'should demonstrate parallel assignments with one variable' do
    first_name, = ["John", "Smith"]
    first_name.should eql __
  end

  it 'should demonstrate swapping with parallel assignment' do
    first_name = "Roy"
    last_name = "Rob"
    first_name, last_name = last_name, first_name
    first_name.should eql __
    last_name.should eql __
  end
end