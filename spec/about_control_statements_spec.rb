require 'spec_helper'

describe "Control Statements" do

  it "should demonstrate if_then_else_statements" do
    if true
      result = :true_value
    else
      result = :false_value
    end
    result.should eql __
  end

  it "should demonstrate if_then_statements" do
    result = :default_value
    if true
      result = :true_value
    end
    result.should eql __
  end

  it "should demonstrate if_statements_return_values" do
    value = if true
              :true_value
            else
              :false_value
            end
    value.should eql __

    value = if false
              :true_value
            else
              :false_value
            end
    value.should eql __

    # NOTE: Actually, EVERY statement in Ruby will return a value, not
    # just if statements.
  end

  it "should demonstrate if_statements_with_no_else_with_false_condition_return_value" do
    value = if false
              :true_value
            end
    value.should eql __
  end

  it "should demonstrate condition_operators" do
    (true ? :true_value : :false_value).should eql __
    (false ? :true_value : :false_value).should eql __
  end

  it "should demonstrate if_statement_modifiers" do
    result = :default_value
    result = :true_value if true

    result.should eql __
  end

  it "should demonstrate unless_statement" do
    result = :default_value
    unless false    # same as saying 'if !false', which evaluates as 'if true'
      result = :false_value
    end
    result.should eql __
  end

  it "should demonstrate unless_statement_evaluate_true" do
    result = :default_value
    unless true    # same as saying 'if !true', which evaluates as 'if false'
      result = :true_value
    end
    result.should eql __
  end

  it "should demonstrate unless_statement_modifier" do
    result = :default_value
    result = :false_value unless false

    result.should eql __
  end

  it "should demonstrate while_statement" do
    i = 1
    result = 1
    while i <= 10
      result = result * i
      i += 1
    end
    result.should eql __
  end

  it "should demonstrate break_statement" do
    i = 1
    result = 1
    while true
      break unless i <= 10
      result = result * i
      i += 1
    end
    result.should eql __
  end

  it "should demonstrate break_statement_returns_values" do
    i = 1
    result = while i <= 10
               break i if i % 2 == 0
               i += 1
             end

    result.should eql __
  end

  it "should demonstrate next_statement" do
    i = 0
    result = []
    while i < 10
      i += 1
      next if (i % 2) == 0
      result << i
    end
    result.should eql __
  end

  it "should demonstrate for_statement" do
    array = ["fish", "and", "chips"]
    result = []
    for item in array
      result << item.upcase
    end
    result.should eql [__, __, __]
  end
end