require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :name => "value for name",
      :body => "value for body"
    )
  end

  it "should render edit form" do
    render "/comments/edit.html.erb"
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('input#comment_name[name=?]', "comment[name]")
      with_tag('textarea#comment_body[name=?]', "comment[body]")
    end
  end
end


