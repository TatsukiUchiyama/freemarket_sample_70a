class ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:products).permit(:name, :description, :condition)
  end

end
