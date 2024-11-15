require 'rails_helper'

RSpec.describe "publications/show", type: :view do
  before(:each) do
    assign(:publication, Publication.create!(
      title: "Title",
      content: "MyText",
      user: nil,
      comment: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
