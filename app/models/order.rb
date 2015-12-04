# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  name             :string
#  payment_address  :string
#  shipping_address :string
#  credit_card_info :string
#  cart_id          :integer
#  amount           :decimal(, )
#  workflow_state   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Order < ActiveRecord::Base
  belongs_to :cart

  include Workflow
  workflow do
    state :new do
      event :ship, :transitions_to => :shipped
      event :cancel, :transitions_to => :cancelled
    end

    state :shipped
    state :cancelled
	end

end
