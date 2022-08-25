class ListingsController < ApplicationController
  def index
    if params[:query].present?
      @listings = policy_scope(Listing.search_listings(params[:query]))
      @markers = @listings.geocoded.map do |listing|
        {
          lat: listing.latitude,
          lng: listing.longitude,
          info_window: render_to_string(partial: "info_window", locals: {listing: listing}),
          image_url: helpers.asset_url("logo.png")
        }
      end
    else
      @listings = policy_scope(Listing)
      @markers = @listings.geocoded.map do |listing|
        {
          lat: listing.latitude,
          lng: listing.longitude,
          info_window: render_to_string(partial: "info_window", locals: {listing: listing}),
          image_url: helpers.asset_url("logo.png")
        }
      end
    end
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

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def update
    @listing = Listing.find(params[:id])
    authorize @listing
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :new
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    authorize @listing
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :address, :category, :rating, :description, :price, photos: [])
  end
end
