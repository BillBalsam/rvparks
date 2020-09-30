class ChangePlacesPhone < ActiveRecord::Migration[5.2]
  def up
    change_table :places do |t|
      t.change :phone, :bigint
    end
  end
  def down
    change_table :places do |t|
      t.change :phone, :integer
    end
  end
end
