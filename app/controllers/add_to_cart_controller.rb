class AddToCartController < ApplicationController
	def index
		product_id = params[:product_id]
		current_user_id = session[:current_user_id]
		@product = Product.find(product_id)
		@user = User.find(current_user_id)
		@item = Item.new
		@item.product = @product
		@item.user = @user
		@item.quantity = 1
		@item.save
		redirect_to products_url
	end
end
