class ShippingsController < ApplicationController

  before_action do
    @cart = session_cart
  end
  
  # GET /shippings/new
  def new
    @shipping = Shipping.new
  end
  def create
    shipping = Shipping.new(shipping_params)
    @cart.shipping = shipping

    respond_to do |format|
      if shipping.save
        @cart.save
        @cart.submit_shipping!
        format.html { redirect_to @cart.next_step, notice: 'Shipping was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_params
      params.require(:shipping).permit(:address, :city, :state, :zip)
    end
end
