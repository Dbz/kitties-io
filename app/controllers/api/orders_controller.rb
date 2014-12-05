class Api::OrdersController < ApplicationController
  def create
    current_cart.add(params[:data][:listing_id].to_i)
    render json: ['success']
  end
  
  def update
    current_cart.add(params[:data][:listing_id].to_i)
    render json: ['success']
  end
  
  def destroy
    if params[:order_id]
      current_cart.remove(params[:order_id].to_i)
    else
      current_cart.remove_by_shop(params[:shop_id].to_i)
    end
    
    render json: ['success']
  end
end
