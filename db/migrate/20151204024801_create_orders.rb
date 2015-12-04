class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :payment_address
      t.string :shipping_address
      t.string :credit_card_info
      t.references :cart, index: true, foreign_key: true
      t.decimal :amount
      t.string :workflow_state

      t.timestamps null: false
    end
  end
end
