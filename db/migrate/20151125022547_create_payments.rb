class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :type
      t.string :name
      t.string :card_number
      t.date :exp_date
      t.integer :cvv
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
