class AddToCartController < ApplicationController
	def index
		product_id = params[:product_id]
		@product = Product.find(product_id)
		@item = Item.new
		@item.product = @product
		@item.quantity = 1
		@item.save
		redirect_to products_url
	end
end
