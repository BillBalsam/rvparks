class AddPhoneToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :phone, :integer
  end
end
