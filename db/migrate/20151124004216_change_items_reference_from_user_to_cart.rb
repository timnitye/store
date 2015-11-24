class ChangeItemsReferenceFromUserToCart < ActiveRecord::Migration
  def change
  	remove_reference :items, :user, index: true, foreign_key: true
  	add_reference :items, :cart, index: true, foreign_key: true
  end
end
