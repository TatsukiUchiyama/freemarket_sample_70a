class ProductsController < ApplicationController
  def index
    @product = Product.find(1)
    @products = Product.includes(:images, :category, :user)
    @ham = Product.where(brand: '伊藤ハム')
  end

  def show
    
  end

end
