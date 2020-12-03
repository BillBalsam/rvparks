class AddBookingToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :booking, :integer
  end
end
