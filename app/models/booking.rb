class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlapping_dates
  validate :check_max_guests
  # validate :uniqueness_of_date_range
  before_save :check_overlapping_dates, :check_max_guests
  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def check_overlapping_dates
    listing.bookings.each do |old_booking|
      if overlap?(self, old_booking)
        # byebug
        return errors.add(:overlapping_dates, "The booking dates conflict with existing bookings")
      end
    end
  end

  def overlap?(x,y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end

  def check_max_guests
    max_guests = listing.max_guest
    return if num_guests <= max_guests
    errors.add(:max_guest, "max guests number exceeded")
  end

  def total_price
    price = listing.price
    num_dates = (start_date..end_date).to_a.length
    return price * num_dates
  end

  # private
  # def uniqueness_of_date_range
  #   errors.add(:start_date, "is not available") unless Booking.where("? >= start_date AND ? <= end_date", start_date, start_date).count == 0
  #   errors.add(:end_date, "is not available") unless Booking.where("? >= start_date AND ? <= end_date", end_date, end_date).count == 0
  # end

end
