class Api::CartsController < ApplicationController
  
  # def index
  #   @cart = current_cart
  #   render :show_cart
  # end
  
  def show
    @cart = current_cart
    render :show_cart
  end
end
