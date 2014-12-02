class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in?, :current_cart
  
  def current_user
    User.find_by(session_token: session[:session_token])
  end
  
  def signed_in?
    !!current_user
  end
  
  def current_cart
    if session[:cart_id]
      cart = Cart.find(session[:cart_id])
    else
      cart = (signed_in? ? Cart.find_by({user_id: current_user.id}) : Cart.create!)
      session[:cart_id] = cart.id
    end
    cart
  end
end
