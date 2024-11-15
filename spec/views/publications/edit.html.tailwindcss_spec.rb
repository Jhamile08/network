require 'rails_helper'

RSpec.describe "publications/edit", type: :view do
  let(:publication) {
    Publication.create!(
      title: "MyString",
      content: "MyText",
      user: nil,
      comment: nil
    )
  }

  before(:each) do
    assign(:publication, publication)
  end

  it "renders the edit publication form" do
    render

    assert_select "form[action=?][method=?]", publication_path(publication), "post" do

      assert_select "input[name=?]", "publication[title]"

      assert_select "textarea[name=?]", "publication[content]"

      assert_select "input[name=?]", "publication[user_id]"

      assert_select "input[name=?]", "publication[comment_id]"
    end
  end
end
