require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/products/index.html.erb" do
  include ProductsHelper
  
  before(:each) do
    assigns[:products] = [
      stub_model(Product,
        :name => "value for name",
        :price => 9.99
      ),
      stub_model(Product,
        :name => "value for name",
        :price => 9.99
      )
    ]
  end

  it "should render list of products" do
    render "/products/index.html.erb"
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "$9.99", 2)
  end
end

