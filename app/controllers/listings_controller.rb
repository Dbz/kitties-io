class ListingsController < ApplicationController
  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: @listing
    else
      render json: @listing.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    #@listing = Listing.includes(:images, :reviews).find(params[:id])
    @listing = Listing.find(params[:id])
    if @listing
      render json: @listing
    else
      render json: ["Listing not found"], status: 404
    end
  end
  
  private
  def listing_params
    params.require(:listing).permit(:name, :price, :available, :description, :shop_id, :policies)
  end
end
