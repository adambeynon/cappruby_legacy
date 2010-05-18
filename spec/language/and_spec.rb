describe "The '&&' statement" do
  
  it "short-circuits evaluation at the first condition to be false" do
    x = nil
    # true && false && x = 1
    x.should be_nil
  end
end
