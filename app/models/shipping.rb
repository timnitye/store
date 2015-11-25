# == Schema Information
#
# Table name: shippings
#
#  id         :integer          not null, primary key
#  address    :text
#  city       :string
#  state      :string
#  zip        :string
#  user_id    :integer
#  cart_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shipping < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
end
