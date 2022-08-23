class ListingsController < ApplicationController
  def index
    @listings = policy_scope(Listing)
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
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

  def listing_params
    params.require(:listing).permit(:name, :address, :category, :rating, :description, :price, photos: [])
  end
end
