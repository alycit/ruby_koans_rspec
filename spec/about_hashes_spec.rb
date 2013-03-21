require 'spec_helper'

describe "Hashes" do

  it "should demonstrate creating hashes" do
    empty_hash = Hash.new
    empty_hash.class.should eql __
    empty_hash.should == {}
    empty_hash.size.should eql __
  end

  it "should demonstrate hash literals" do
    hash = { :one => "uno", :two => "dos" }
    hash.size.should eql __
  end

  it "should demonstrate accessing hashes" do
    hash = { :one => "uno", :two => "dos" }
    hash[:one].should eql __
    hash[:two].should eql __
    hash[:doesnt_exist].should eql __
  end

  it "should demonstrate accessing hashes with fetch" do
    hash = { :one => "uno" }
    hash.fetch(:one).should eql __
    expect{ hash.fetch(:doesnt_exist) }.to raise_error(__)

    # THINK ABOUT IT:
    #
    # Why might you want to use #fetch instead of #[] when accessing hash keys?
  end

  it "should demonstrate changing hashes" do
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => __, :two => "dos" }
    (expected == hash).should eql __

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
  end

  it "should demonstrate that a hash is unordered" do
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    (hash1 == hash2).should eql __
  end

  it "should demonstrate hash keys" do
    hash = { :one => "uno", :two => "dos" }
    hash.keys.size.should eql __
    hash.keys.include?(:one).should eql __
    hash.keys.include?(:two).should eql __
    hash.keys.class.should eql __
  end

  it "should demonstrate hash values" do
    hash = { :one => "uno", :two => "dos" }
    hash.values.size.should eql __
    hash.values.include?("uno").should eql __
    hash.values.include?("dos").should eql __
    hash.values.class.should eql __
  end

  it "should demonstrate combining hashes" do
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    (hash != new_hash).should eql __

    expected = { "jim" => __, "amy" => 20, "dan" => 23, "jenny" => __ }
    (expected == new_hash).should eql __
  end

  it "should demonstrate default values" do
    hash1 = Hash.new
    hash1[:one] = 1

    hash1[:one].should eql __
    hash1[:two].should eql __

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    hash2[:one].should eql __
    hash2[:two].should eql __
  end

  it "should demonstrate that the default value is the same object" do
    hash = Hash.new([])

    hash[:one] << "uno"
    hash[:two] << "dos"

    hash[:one].should eql __
    hash[:two].should eql __
    hash[:three].should eql __

    (hash[:one].object_id == hash[:two].object_id).should eql __
  end

  it "should demonstrate default value with a block" do
    hash = Hash.new {|hash, key| hash[key] = [] }

    hash[:one] << "uno"
    hash[:two] << "dos"

    hash[:one].should eql __
    hash[:two].should eql __
    hash[:three].should eql __
  end
end