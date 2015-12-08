class OrdersController < AdminController

	def index
		@orders = Order.all
	end

	def show
	
	end

	def update
		id = params[:id];
		@order = Order.find(id);
		@order.ship! if @order.new?
		respond_to do |format|
			format.html {}
			format.json { render(json: @order) }
		end

	end
end
