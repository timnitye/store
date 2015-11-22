class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy] 

  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def create
    Product.create(product_params)
  	redirect_to products_url #Product#index
  end

  def show
  end 

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to @product
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end	

  def find_product
    @product = Product.find(params[:id])
  end
end