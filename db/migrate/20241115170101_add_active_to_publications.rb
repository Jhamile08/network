class AddActiveToPublications < ActiveRecord::Migration[7.2]
  def change
    add_column :publications, :active, :boolean
  end
end
