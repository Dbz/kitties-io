class Api::CartsController < ApplicationController
  def add
    @cart = current_cart
    @cart.add(params[:id])
    render json: @cart
  end
  
  def show
    @cart = current_cart
    render :show_cart
  end
end
