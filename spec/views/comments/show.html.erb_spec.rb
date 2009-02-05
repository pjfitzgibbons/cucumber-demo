require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :name => "value for name",
      :body => "value for body"
    )
  end

  it "should render attributes in <p>" do
    render "/comments/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ body/)
  end
end

