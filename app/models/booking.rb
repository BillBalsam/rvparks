class Booking < ApplicationRecord
    belongs_to :place
    validates :name, presence: { message: "can't be blank"}
    

    validate :validate_other_booking_overlap


    private

    def validate_other_booking_overlap
        sql = ":end_time >= start_time and end_time >= :start_time and place_id = :place_id"
        is_overlapping = Booking.where(sql, start_time: start_time, end_time: end_time, place_id: place_id).exists?
        errors.add(:base, "Dates can't overlap") if is_overlapping
    end
end

