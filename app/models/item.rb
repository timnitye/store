# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer
#

class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def price
  	product.price * quantity if product
  end

end
