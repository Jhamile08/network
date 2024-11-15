class AddPublicationIdToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :publication, foreign_key: true, null: true
  end
end
