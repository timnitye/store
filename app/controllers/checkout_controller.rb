class CheckoutController < ApplicationController
  def index
  	if session[:current_user_id]
  		redirect_to new_payment_url
  	else
  		redirect_to signin_url(next_action: new_payment_url)
  	end
  end
end
