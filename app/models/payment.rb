# == Schema Information
#
# Table name: payments
#
#  id          :integer          not null, primary key
#  type        :integer
#  name        :string
#  card_number :string
#  exp_date    :date
#  cvv         :integer
#  address     :text
#  city        :string
#  state       :string
#  zip         :string
#  user_id     :integer
#  cart_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :cart
end
