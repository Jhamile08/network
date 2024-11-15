require 'rails_helper'

RSpec.describe Publication, type: :model do
  it 'should save publication with valid attributes' do
    user = User.create!(email: 'john@example.com', password: 'password')
    category = Category.create!(name: 'comida')

    publication = Publication.new(
      title: 'Test Title',
      content: 'Test Content',
      user: user, # Pasando el objeto completo en lugar del id
      category: category, # Pasando el objeto completo en lugar del id
      active: true
    )

    expect(publication.save).to be_truthy
  end
end
