class AddToCartController < ApplicationController
	def index
		product_id = params[:product_id].to_i
		
		# current_user_id = session[:current_user_id]
		# @product = Product.find(product_id)
		# @user = User.find(current_user_id)
		# @item = Item.new
		# @item.product = @product
		# @item.user = @user
		# @item.quantity = 1
		# @item.save
		# redirect_to products_url

		#find session cart
		cart = Cart.find(session[:cart_id]) if session[:cart_id]
		
		#or create new one
		cart = Cart.new unless cart

		#find first item in cart that matches product_id from params
		item = cart.items.select{|i| i.product_id == product_id}.first
		
		if item
			#increment quantity
			item.quantity += 1
			item.save
		else
			#otherwise create a new item
			item = Item.create(product_id: product_id, quantity: 1) 

			#add item to cart
			cart.items << item
		end
		
		cart.save
		
		#store cart_id in session for later use
		session[:cart_id] = cart.id

		redirect_to products_url
	end
	
end
