class ShoppingCartController < ApplicationController
  def index
  	if user_id = session[:current_user_id]
	  	@items = Item.where(user_id: user_id)
	end
  end
end
