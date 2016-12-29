class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update]

  def index
    @listings = Listing.all.order(:title).page params[:page]
    # @listings
  end

  def new
    @listing = Listing.new
    # user = current_user.id
    # if @user.customer?
    #   flash[:notice] = "Sorry, You are not allowed"
    #   return redirect_to some_other_url, notice: "Sorry you got no permission"
    # end
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path
    end
  end

  def show
    @booking = @listing.bookings.new
  end

  def edit
    # if
    #   en
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
    params.require(:listing).permit(:title,:page, :description, :max_guest, :price)
  end


end
