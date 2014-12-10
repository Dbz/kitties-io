class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      session[:session_token] = @user.reset_session_token!
      # TODO: Merge carts before switching
      session[:cart_id] = Cart.find_by({ user_id: @user.id }).id
      render json: @user
    else
      render json: ['Invalid Username/Password'], status: 422
    end
  end
  
  def destroy
    if signed_in?
      @user = current_user
      if @user.username == 'guest'
        @user.cart.orders.destroy_all
        Order.create(cart_id: @user.cart.id, listing_id: 4, amount: 1)
        Order.create(cart_id: @user.cart.id, listing_id: 5, amount: 1)
        Order.create(cart_id: @user.cart.id, listing_id: 6, amount: 1)
        Order.create(cart_id: @user.cart.id, listing_id: 12, amount: 1)
        Order.create(cart_id: @user.cart.id, listing_id: 13, amount: 1)
        Order.create(cart_id: @user.cart.id, listing_id: 14, amount: 1)
      end
      @user.reset_session_token!
      session[:session_token] = nil
      session[:cart_id] = nil
      render json: ["success"]
    else
      render json: ["failure"], status: 422
    end
  end
end
