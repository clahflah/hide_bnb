class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def new
    @listing = Listing.new
    authroize @listing
  end

  def create
    @listing = Listing.new(required_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing = List.find(params[:id])
    authorize @listing
    @listing.delete
    redirect_to listings_path
  end

  private

  def required_params
    params.requrire(:listing).permit(:name, :address, :category, :price, :image, :rating, :description)
  end
end
