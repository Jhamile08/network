require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'is valid with valid attributes' do
    # si se necesita algun dato se
    category = Category.new(name: 'scissors')
    expect(category).to be_valid
  end
end
