class BookingsController < ApplicationController
  # before_save :check_overlapping_dates, :check_max_guests, :uniqueness_of_date_range

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.listing = @listing
    # byebug
    if @booking.save
      redirect_to current_user
    else
      @errors = @booking.errors.full_messages
      render "listings/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @booking.user
  end

  private
  def booking_params
    params.require(:booking).permit(:num_guests, :start_date, :end_date)
  end
end
