describe "Nil" do

  it "should show that nil is an object" do
    nil.is_a?(Object).should == __
  end

  it "should not cause null pointer errors when calling methods on nil" do
    begin
      nil.some_method_nil_doesnt_know_about
    rescue Exception => ex
      ex.class.should == __

      ex.message.should =~ /__/
    end
  end

  it "should display methods nil has defined for it" do
    nil.nil?.should eq __
    nil.to_s.should eq __
    nil.inspect.should eq __
  end

end