class Api::ListingsController < ApplicationController
  def create
    @listing = Api::Listing.new(listing_params)
    if @listing.save
      render json: @listing, include: [:images, :shop, :reviews]
    else
      render json: @listing.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    @listing = Api::Listing.find(params[:id])
    # @listing = Api::Listing.includes(:images, :reviews).find(params[:id])
    # @listing = Api::Listing.find(params[:id])
    if @listing
      render json: @listing, include: [:images, :shop, :reviews]
    else
      render json: ["Listing not found"], status: 404
    end
  end
  
  private
  def listing_params
    params.require(:listing).permit(:name, :price, :available, :description, :shop_id, :policies)
  end
end