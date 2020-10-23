class AddPlaceableIdToCharges < ActiveRecord::Migration[5.2]
  def change
    add_column :charges, :placeable_id, :integer
  end
end
