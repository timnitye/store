class AddToCartController < ApplicationController
	def index
		product_id = params[:product_id].to_i

		#find session cart
		cart = Cart.find(session[:cart_id]) if session[:cart_id]
		
		#or create new one
		cart = Cart.new unless cart

		cart.user = current_user

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
		
		respond_to do |format|
			format.html{
				redirect_to products_url
			}
			
			format.json{ 
				render json: {items_count: cart.items.count} 
			}
		end
	end

	def destroy
		# product_id = params[:product_id];
		# cart = Cart.find(session[:cart_id])
		# deletable_item = cart.items.select{|i| i.product.id == product_id}
		# deletable_item.each{|i| i.destroy}

		item_id = params[:id]
		item = Item.find(item_id)
		item.delete

		render json: {deleted_item: item_id}
	end
	
end
