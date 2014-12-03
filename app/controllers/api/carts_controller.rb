class Api::CartsController < ApplicationController
  def change
    @cart = current_cart

    if params[:add] == "true"
      @cart.add(params[:id].to_i)
    elsif params[:remove] == "listing"
      @cart.remove(params[:id].to_i)
    elsif params[:remove] == "shop"
      @cart.remove_by_shop(params[:shop_id].to_i)
    end
    
    render :show_cart
  end
  
  def show
    @cart = current_cart
    render :show_cart
  end
end
