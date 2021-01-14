class Booking < ApplicationRecord
    belongs_to :place
    validates :name, presence: { message: "Name can't be blank"}
    

    validate :validate_other_booking_overlap

    def period
        start_time..end_time
    end

    private

    def validate_other_booking_overlap
        other_bookings = Booking.all
        is_overlapping = other_bookings.any? do |other_booking|
            period.overlaps?(other_booking.period)
        end
        # errors.add(:overlaps_with_other) if is_overlapping

    end
end