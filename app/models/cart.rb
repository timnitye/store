# == Schema Information
#
# Table name: carts
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  workflow_state :string
#  payment_id     :integer
#  shipping_id    :integer
#

class Cart < ActiveRecord::Base
	include Rails.application.routes.url_helpers

  belongs_to :user
  has_many :items
  belongs_to :payment
  belongs_to :shipping

  include Workflow
  workflow do
    state :new do
      event :checkout, :transitions_to => :awaiting_user
    end
    state :awaiting_user do
      event :assign_user, :transitions_to => :awaiting_payment
    end
    state :awaiting_payment do
      event :submit_payment, :transitions_to => :awaiting_shipping
    end
    state :awaiting_shipping do
      event :submit_shipping, :transitions_to => :awaiting_confirmation
    end
    state :awaiting_confirmation do
    	event :confirm, :transitions_to => :confirmed
    	event :cancel, :transitions_to => :cancelled
    end
    state :confirmed do
    	event :ship, :transitions_to => :shipped
    end

    state :cancelled
    state :shipped
  end

  def next_step
  	#view resolver patternp
  	
		
		url = signin_url              if awaiting_user?
		url = new_payment_url         if awaiting_payment?
		url = new_shipping_url        if awaiting_shipping?
		url = order_confirmations_url if awaiting_confirmation?
		url = order_confirmation_url(id)       if confirmed?
		url
  end

  def merge_items!(cart)
    if items.present? && cart.items
      items << cart.items
    end
    
    return cart if save
  end

  def confirm
    Order.new(
      name: user.email,
      payment_address: payment.full_address,
      shipping_address: shipping.full_address,
      credit_card_info: payment.credit_card_info,
      cart_id: id,
      amount: total_amount).save

  end

def total_amount
    items.map{|i|i.price}.reduce(:+)
  end
end
