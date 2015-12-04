class OrderConfirmationsController < ApplicationController
  def index
  	#order confirmation
  end

  def show
  	#thank you page
  	@cart = session_cart
  	session[:cart_id] = nil
  end

  def create
  	#confirm order clicked
  	session_cart.confirm!
  	redirect_to session_cart.next_step
  end
end
