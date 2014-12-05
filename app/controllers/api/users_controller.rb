class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if(@user.save)
      render json: @user
      session[:session_token] = @user.reset_session_token!
    else
      render json: @user.errors.full_messages, status: 422
    end
  end
  
  def index
    if current_user
      render json: current_user, include: [:image]
    else
      render json: User.new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
