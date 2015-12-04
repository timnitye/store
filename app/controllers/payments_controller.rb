class PaymentsController < ApplicationController
  before_action do
    @cart = session_cart
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  def create
    payment = Payment.new(payment_params)
    @cart.payment = payment

    respond_to do |format|
      if payment.save 
        @cart.save
        @cart.submit_payment!
        format.html { redirect_to @cart.next_step, notice: 'Payment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:type, :name, :card_number, :exp_date, :cvv, :address, :city, :state, :zip, :user_id, :cart_id)
    end
end
