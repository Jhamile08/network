class AddCategoryIdToPublications < ActiveRecord::Migration[7.2]
  def change
    add_reference :publications, :category, null: false, foreign_key: true
  end
end