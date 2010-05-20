describe "The '&&' statement" do
  
  it "short-circuits evaluation at the first condition to be false" do
    x = nil
    # x = 200
    # true && false && x = 1
    x.should be_nil
  end
  
  it "should fail" do
    x = 10
    x.should be_nil
  end
  
  # it "is not yet implemented"
  
  it "should equal nil" do
    nil.should == nil
  end
  
  it "should equal nil ERROR" do
    10.should == nil
  end
end
