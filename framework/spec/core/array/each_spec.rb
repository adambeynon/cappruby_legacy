
describe "Array#each" do
  it "yields each item to the block" do
    a = []
    x = [1, 2, 3]
    x.each do |item|
      a << item
    end.should == a
    
    a.should == [1, 2, 3]
  end
end
