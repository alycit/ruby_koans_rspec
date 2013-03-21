require 'spec_helper'

def my_global_method(a,b)
  a + b
end

describe "Methods" do


  it "should demonstrate calling_global_methods" do
    my_global_method(2,3).should eql __
  end

  it "should demonstrate calling_global_methods_without_parentheses" do
    result = my_global_method 2, 3
    result.should eql __
  end

  # (NOTE: We are Using eval below because the example code is
  # considered to be syntactically invalid).
  it "should demonstrate sometimes_missing_parentheses_are_ambiguous" do
    eval "expect(5).should eql my_global_method 2, 3" # ENABLE CHECK
                                                 #
                                                 # Ruby doesn't know if you mean:
                                                 #
                                                 #   assert_equal(5, my_global_method(2), 3)
                                                 # or
                                                 #   assert_equal(5, my_global_method(2, 3))
                                                 #
                                                 # Rewrite the eval string to continue.
                                                 #
  end

  # NOTE: wrong number of argument is not a SYNTAX error, but a
  # runtime error.
  it "should demonstrate calling_global_methods_with_wrong_number_of_arguments" do
    expect{ my_global_method }.to raise_error(__, /__/)

    expect{ my_global_method(1,2,3) }.to raise_error(__, /__/)
  end

  # ------------------------------------------------------------------

  def method_with_defaults(a, b=:default_value)
    [a, b]
  end

  it "should demonstrate calling_with_default_values" do
    method_with_defaults(1).should eql [1, __]
    method_with_defaults(1, 2).should eql [1, __]
  end

  # ------------------------------------------------------------------

  def method_with_var_args(*args)
    args
  end

  it "should demonstrate calling_with_variable_arguments" do
    method_with_var_args.class.should eql __
    method_with_var_args.should eql __
    method_with_var_args(:one).should eql __
    method_with_var_args(:one, :two).should eql __
  end

  # ------------------------------------------------------------------

  def method_with_explicit_return
    :a_non_return_value
    return :return_value
    :another_non_return_value
  end

  it "should demonstrate method_with_explicit_return" do
    method_with_explicit_return.should eql __
  end

  # ------------------------------------------------------------------

  def method_without_explicit_return
    :a_non_return_value
    :return_value
  end

  it "should demonstrate method_without_explicit_return" do
    method_without_explicit_return.should eql __
  end

  # ------------------------------------------------------------------

  def my_method_in_the_same_class(a, b)
    a * b
  end

  it "should demonstrate calling_methods_in_same_class" do
    my_method_in_the_same_class(3,4).should eql __
  end

  it "should demonstrate calling_methods_in_same_class_with_explicit_receiver" do
    self.my_method_in_the_same_class(3,4).should eql __
  end

  # ------------------------------------------------------------------

  def my_private_method
    "a secret"
  end
  private :my_private_method

  it "should demonstrate calling_private_methods_without_receiver" do
    my_private_method.should eql __
  end

  it "should demonstrate calling_private_methods_with_an_explicit_receiver" do
    expect(self.my_private_method).to raise_error(__, /__/)
  end

  # ------------------------------------------------------------------

  class Dog
    def name
      "Fido"
    end

    private

    def tail
      "tail"
    end
  end

  it "should demonstrate calling_methods_in_other_objects_require_explicit_receiver" do
    rover = Dog.new
    rover.name.should eql __
  end

  it "should demonstrate calling_private_methods_in_other_objects" do
    rover = Dog.new
    expect(rover.tail).to raise_error __
  end
end