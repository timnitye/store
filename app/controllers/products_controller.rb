class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy] 
  before_action :authorize, except: [:index, :show]

  def index
  	@products = Product.all
  end

  def new
    if current_user && current_user.has_role?('admin')
    	@product = Product.new
    else
      redirect_to signin_url
    end
  end

  def create
    if current_user && current_user.has_role?('admin')
      Product.create(product_params)
    	redirect_to products_url #Product#index
    else
      redirect_to signin_url
    end
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
    params.require(:product).permit(:name, :description, :price, :photo)
  end	

  def find_product
    @product = Product.find(params[:id])
  end

  
end