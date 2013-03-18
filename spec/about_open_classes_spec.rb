require 'spec_helper'

describe "Open Classes" do
  class Dog
    def bark
      "WOOF"
    end
  end

  it "should demonstrate as_defined_dogs_do_bark" do
    fido = Dog.new
    fido.bark.should eql __
  end

  # ------------------------------------------------------------------

  # Open the existing Dog class and add a new method.
  class Dog
    def wag
      "HAPPY"
    end
  end

  it "should demonstrate after_reopening_dogs_can_both_wag_and_bark" do
    fido = Dog.new
    fido.wag.should eql __
    fido.bark.should eql __
  end

  # ------------------------------------------------------------------

  class ::Integer
    def even?
      (self % 2) == 0
    end
  end

  it "should demonstrate even_existing_built_in_classes_can_be_reopened" do
    1.even?.should eql __
    2.even?.should eql __
  end

  # NOTE: To understand why we need the :: before Integer, you need to
  # become enlightened about scope.  
end