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

class Payment < ActiveRecord::Base
  belongs_to :user
  has_many :carts

  def full_address
	"name: #{name} \n
	address: #{address} \n
	#{city}, #{state} #{zip}"
  end

  def credit_card_info
  	"cart type: #{card_type} \n
	card: #{card_type} | #{card_number} | #{exp_date} | #{cvv}"
  end
end
