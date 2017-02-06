class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product saved!"
      redirect_to root_path
    else
      flash.now[:alert] = "Something went wrong!"
      render "new"
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:notice] = "Product saved!"
      redirect_to root_path
    else
      flash.now[:alert] = "Something went wrong!"
      render "new"
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product deleted!"
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image_url, :price_in_cents)
  end

  def find_product
    @product = Product.find_by(params[:id])
  end
end
