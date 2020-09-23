class AlterPlacesAddPlaceableIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :placeable_id, :integer
    add_column :places, :placeable_type, :string
  end
end
