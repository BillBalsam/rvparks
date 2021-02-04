class Booking < ApplicationRecord
    belongs_to :place
    validates :name, presence: { message: "Name can't be blank"}
    

    validate do |comment| 
        comment.validate_other_booking_overlap
    end

    def period
        start_time..end_time
    end

    

    def validate_other_booking_overlap
        other_bookings = Booking.all
        is_overlapping = other_bookings.any? do |other_booking|
            period.overlaps?(other_booking.period)
        end
        errors.add(:base, 'Please check booking, dates cannot overlap') if is_overlapping

    end
end