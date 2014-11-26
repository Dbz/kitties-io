class Api::ShopsController < ApplicationController
  def featured_shops
    # render json: Shop.all.sample(3), include: [:reviews, :listings]
    @shops = Shop.all.sample(params[:num].to_i)
    render :featured_shops
  end
  
  def show
    render :json => Shop.find(params[:id]), include: [:reviews, :listings]
  end
end
