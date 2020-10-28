class AddCostToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :cost, :decimal
  end
end
