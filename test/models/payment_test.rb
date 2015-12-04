# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  card_type   :integer
#  name        :string
#  card_number :string
#  exp_date    :date
#  cvv         :integer
#  address     :text
#  city        :string
#  state       :string
#  zip         :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
