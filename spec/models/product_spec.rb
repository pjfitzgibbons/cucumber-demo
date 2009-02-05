require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Product do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :price => 9.99
    }
  end

  it "should create a new instance given valid attributes" do
    Product.create!(@valid_attributes)
  end

  it "should have comments" do
    Product.new.comments.should == []
  end

  it "should retrieve related comments" do
    tv = Product.create(:name => 'tv', :price => 1.0)
    comment = Comment.create(:name => 'bob', :body => 'Great!', :product_id => tv.id)
    tv.comments.should == [comment]
  end
end
