class ShoppingCartController < ApplicationController
  def index
  	
 #  	if user_id = session[:current_user_id]
	#   	@items = Item.where(user_id: user_id)
	# end
	if cart_id = session[:cart_id]
		@cart = Cart.find(cart_id) 
		@items = @cart.items
	end
  end
end
