require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/show.html.erb" do
  include ProductsHelper
  before(:each) do
    assigns[:product] = @product = stub_model(Product,
      :name => "value for name",
      :price => 9.99
    )
  end

  it "should render attributes in <p>" do
    render "/products/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/9\.99/)
  end
end

