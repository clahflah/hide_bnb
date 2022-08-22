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
    @listing = Listing.new(required_params)
  end

  private

  def required_params
    params.requrire(:listing).permit(:name, :address, :category, :price, :image, :rating, :description, :user_id)
  end
end
