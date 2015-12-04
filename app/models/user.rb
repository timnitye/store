# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	has_many :carts
	has_many :user_roles
	has_many :roles, through: :user_roles

	def current_cart
		carts.last
	end

	def has_open_cart?
		current_cart.present?
	end

	def has_role?(role_name)
		roles.where(name: role_name).present?
	end

end
