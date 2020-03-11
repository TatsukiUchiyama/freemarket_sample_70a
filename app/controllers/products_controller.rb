class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images, :category, :user)
    @ham = Product.where(brand: '伊藤ハム')
  end

  def show
    
  end

end
