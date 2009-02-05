require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/show.html.erb" do
  include ProductsHelper
  before(:each) do
    @comments = [
      stub_model(Comment, :name => 'Bob', :body => 'Great!'),
      stub_model(Comment, :name => 'Sue', :body => 'Good stuff.  Write More!'),
    ]
    assigns[:product] = @product = stub_model(Product,
      :name => "value for name",
      :price => 9.99,
      :comments => @comments
    )
  end

  it "should render attributes in <p>" do
    render "/products/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/9\.99/)
    response.should have_text(/2 comments/)
    response.should have_text(/Sue says/)
    response.should have_text(/Bob says/)
#    response.should have_tag
  end
end

