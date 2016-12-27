class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "Successfuly updated the listing"
      redirect_to @listing
    else
      flash[:danger] = "Error updating listing"
      render :edit
    end
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :max_guest, :price)
  end
end