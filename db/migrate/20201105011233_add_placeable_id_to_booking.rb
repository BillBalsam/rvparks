class AddPlaceableIdToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :placeable_id, :integer
  end
end
