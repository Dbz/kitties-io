class Api::ShopsController < ApplicationController
  def featured_shops
    render json: Shop.all.sample(3)
  end
  
  def show
    render :json => Shop.find(params[:id])
  end
end
