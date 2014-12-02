class Api::CartsController < ApplicationController
  def add
    @cart = current_cart
    @cart.add(params[:product])
    render json: @cart
  end
  
  def show
    @cart = current_cart
    render json: @cart
  end
end
