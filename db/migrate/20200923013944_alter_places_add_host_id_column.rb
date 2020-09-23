class AlterPlacesAddHostIdColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :host_id, :integer
  end
end
