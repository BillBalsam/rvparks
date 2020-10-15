class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.integer :place_id
      t.integer :user_id
      t.timestamps
    end
  end
end
