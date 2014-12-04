class Api::CartsController < ApplicationController
  
  def show
    @cart = current_cart
    render :show_cart
  end
end
