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
      current_user.reset_session_token!
      session[:session_token] = nil
      session[:cart_id] = nil
      redirect_to root_url
    end
    return
  end
end
