class Api::ShopsController < ApplicationController
  def featured_shops
    # render json: Shop.all.sample(3), include: [:reviews, :listings]
    @shops = Shop.all.sample(params[:num].to_i)
    render :featured_shops
  end
  
  def show
    # render :json => Shop.find(params[:id]), include: [:reviews, :listings]
    @shop = Shop.find(params[:id])
    render :show_shop
  end
  
  def search
    @listings = Listing.search(URI.unescape(params[:text])).where({ shop_id: params[:id] })
    puts
    puts
    puts
    puts
    puts
    puts
    puts "hello"
    puts
    puts @listings.count
    puts
    puts
    puts
    puts
    puts "goodbye"
    puts
    render :search_listing
  end
end
