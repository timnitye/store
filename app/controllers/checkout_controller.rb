class CheckoutController < ApplicationController
  def index

  	session_cart.checkout! if session_cart.new?

  	if current_user && session_cart.awaiting_user?
	  	session_cart.user = current_user
	  	session_cart.assign_user!
  	end

  	redirect_to session_cart.next_step
  end
end
