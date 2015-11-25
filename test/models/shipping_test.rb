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

require 'test_helper'

class ShippingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
