class Api::ShopsController < ApplicationController
  def featured_shops
    @shops = Shop.all.sample(params[:num].to_i)
    render :featured_shops
  end
  
  def show
    @shop = Shop.find(params[:id])
    render :show_shop
  end
  
  def search
    @listings = Listing.search(URI.unescape(params[:text])).where({ shop_id: params[:id] })
    render :search_listing
  end
end
