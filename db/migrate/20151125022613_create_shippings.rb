class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, index: true, foreign_key: true
    
      t.timestamps null: false
    end
  end
end
