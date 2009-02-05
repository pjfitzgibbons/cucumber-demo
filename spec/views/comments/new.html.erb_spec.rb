require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/new.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true,
      :name => "value for name",
      :body => "value for body"
    )
  end

  it "should render new form" do
    render "/comments/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("input#comment_name[name=?]", "comment[name]")
      with_tag("textarea#comment_body[name=?]", "comment[body]")
    end
  end
end


