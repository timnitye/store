class AddPaymentToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :payment, index: true, foreign_key: true
    add_reference :carts, :shipping, index: true, foreign_key: true
  end
end
