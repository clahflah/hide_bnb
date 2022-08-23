class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.listing = Listing.find(params[:listing_id])
    authorize @booking
    @user = current_user
    if @booking.save
      redirect_to user_bookings_path(@user)
    else
      render :new
    end
  end

  def index
    @bookings = policy_scope(Booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
