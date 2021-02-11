class Booking < ApplicationRecord
    belongs_to :place
    validates :name, presence: { message: "can't be blank"}
    

    validate :validate_other_booking_overlap

    def period
        start_time..end_time
    end



    def validate_other_booking_overlap
        other_bookings = Booking.find_by_sql ['SELECT * FROM bookings WHERE place_id = ?', @place]
        is_overlapping = other_bookings.any? do |other_booking|
            period.overlaps?(other_booking.period)
        end
        if is_overlapping
            errors.add(:base, 'Please check booking, dates cannot overlap')
        else
            errors.add(:base, 'Booking was successful')
        end
    end
end