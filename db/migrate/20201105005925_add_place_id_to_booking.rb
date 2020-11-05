class AddPlaceIdToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :place_id, :integer
  end
end
