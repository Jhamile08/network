require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    # si se necesita algun dato se
    user = User.create(email: 'john@example.com')
    comment = Comment.new(content: 'scissors', user: user)
    expect(comment).to be_valid
  end
end
