class ProductsController < ApplicationController
  def index
    @product = Product.find(1)
    @products = Product.includes(:images, :category, :user)
    @ham = Product.where(brand: '伊藤ハム')
  end

  def show
    @product = Product.find(params[:id])
    @user = @product.user
    @parents = Category.all.order("id ASC").limit(13)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:products).permit(:name, :description, :condition, :brand, :shipping_payer, :shipping_from_area, :shipping_duration, :price,)
  end

end
