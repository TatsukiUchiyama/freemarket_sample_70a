class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @user = User.find(@product.user_id)
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
