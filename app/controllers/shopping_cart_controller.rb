class ShoppingCartController < ApplicationController
  def index
  	@items = Item.all
  end
end
