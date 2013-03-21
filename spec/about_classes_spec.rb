require 'spec_helper'

describe "Classes" do

  class Dog
  end

  it "should demonstrate instances_of_classes_can_be_created_with_new" do
    fido = Dog.new
    fido.class.should eql __
  end

  # ------------------------------------------------------------------

  class Dog2
    def set_name(a_name)
      @name = a_name
    end
  end

  it "should demonstrate instance_variables_can_be_set_by_assigning_to_them" do
    fido = Dog2.new
    fido.instance_variables.should eql __

    fido.set_name("Fido")
    fido.instance_variables.should eql __
  end

  it "should demonstrate instance_variables_cannot_be_accessed_outside_the_class" do
    fido = Dog2.new
    fido.set_name("Fido")

    expect(fido.name).to raise_error(__)

    expect(eval "fido.@name").to raise_error(__)

    # NOTE: Using eval because the above line is a syntax error.
  end

  it "should demonstrate you_can_politely_ask_for_instance_variable_values" do
    fido = Dog2.new
    fido.set_name("Fido")

    fido.instance_variable_get("@name").should eql __
  end

  it "should demonstrate you_can_rip_the_value_out_using_instance_eval" do
    fido = Dog2.new
    fido.set_name("Fido")

    fido.instance_eval("@name")  # string version.should eql __
    fido.instance_eval { @name } # block version.should eql __
  end

  # ------------------------------------------------------------------

  class Dog3
    def set_name(a_name)
      @name = a_name
    end
    def name
      @name
    end
  end

  it "should demonstrate you_can_create_accessor_methods_to_return_instance_variables" do
    fido = Dog3.new
    fido.set_name("Fido")

    fido.name.should eql __
  end

  # ------------------------------------------------------------------

  class Dog4
    attr_reader :name

    def set_name(a_name)
      @name = a_name
    end
  end


  it "should demonstrate attr_reader_will_automatically_define_an_accessor" do
    fido = Dog4.new
    fido.set_name("Fido")

    fido.name.should eql __
  end

  # ------------------------------------------------------------------

  class Dog5
    attr_accessor :name
  end


  it "should demonstrate attr_accessor_will_automatically_define_both_read_and_write_accessors" do
    fido = Dog5.new

    fido.name = "Fido"
    fido.name.should eql __
  end

  # ------------------------------------------------------------------

  class Dog6
    attr_reader :name
    def initialize(initial_name)
      @name = initial_name
    end
  end

  it "should demonstrate initialize_provides_initial_values_for_instance_variables" do
    fido = Dog6.new("Fido")
    fido.name.should eql __
  end

  it "should demonstrate args_to_new_must_match_initialize" do
    expect(Dog6.new).to raise_error(__)
    # THINK ABOUT IT:
    # Why is this so?
  end

  it "should demonstrate different_objects_have_different_instance_variables" do
    fido = Dog6.new("Fido")
    rover = Dog6.new("Rover")

    (rover.name != fido.name).should eql __
  end

  # ------------------------------------------------------------------

  class Dog7
    attr_reader :name

    def initialize(initial_name)
      @name = initial_name
    end

    def get_self
      self
    end

    def to_s
      __
    end

    def inspect
      "<Dog named '#{name}'>"
    end
  end

  it "should demonstrate inside_a_method_self_refers_to_the_containing_object" do
    fido = Dog7.new("Fido")

    fidos_self = fido.get_self
    fidos_self.should eql __
  end

  it "should demonstrate to_s_provides_a_string_version_of_the_object" do
    fido = Dog7.new("Fido")
    fido.to_s.should eql __
  end

  it "should demonstrate to_s_is_used_in_string_interpolation" do
    fido = Dog7.new("Fido")
    "My dog is #{fido}".should eql __
  end

  it "should demonstrate inspect_provides_a_more_complete_string_version" do
    fido = Dog7.new("Fido")
    fido.inspect.should eql __
  end

  it "should demonstrate all_objects_support_to_s_and_inspect" do
    array = [1,2,3]

    array.to_s.should eql __
    array.inspect.should eql __

    "STRING".to_s.should eql __
    "STRING".inspect.should eql __
  end

end