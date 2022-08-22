class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @user = User.find(:user_id)
    @listing = Listing.new(required_params)
    @listing.user_id = @user
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing = List.find(params[:id])
    @listing.delete
    redirect_to listings_path
  end

  private

  def required_params
    params.requrire(:listing).permit(:name, :address, :category, :price, :image, :rating, :description, :user_id)
  end
end
