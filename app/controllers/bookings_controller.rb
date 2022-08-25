class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.price = (@booking.end_date - @booking.date) * @listing.price
    authorize @booking
    @user = current_user
    if @user.id == @listing.user_id
      render:new
    elsif @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @user = current_user
    @listing = Listing.all.where(user_id: @user.id)
    @bookings = policy_scope(Booking)
    @received_bookings = @user.received_bookings
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    @listing = @booking.listing
    authorize @booking
    @booking.price = (@booking.end_date - @booking.date) * @listing.price
    if params[:accepted]
      @booking.update(accepted: true)
    end
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :end_date, :accepted)
  end
end
