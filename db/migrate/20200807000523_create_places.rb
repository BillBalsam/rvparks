class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :park_name
      t.integer :zip_code
      t.string :address
      t.timestamps
    end
  end
end
