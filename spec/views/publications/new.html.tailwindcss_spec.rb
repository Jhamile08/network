require 'rails_helper'

RSpec.describe "publications/new", type: :view do
  before(:each) do
    assign(:publication, Publication.new(
      title: "MyString",
      content: "MyText",
      user: nil,
      comment: nil
    ))
  end

  it "renders new publication form" do
    render

    assert_select "form[action=?][method=?]", publications_path, "post" do

      assert_select "input[name=?]", "publication[title]"

      assert_select "textarea[name=?]", "publication[content]"

      assert_select "input[name=?]", "publication[user_id]"

      assert_select "input[name=?]", "publication[comment_id]"
    end
  end
end
