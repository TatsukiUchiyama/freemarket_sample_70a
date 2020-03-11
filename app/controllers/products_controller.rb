class ProductsController < ApplicationController
  def index
    # @ham = Product.where(category_id: 2)
    @ham = Product.where(brand: '伊藤ハム')
  end

  def show
    
  end

end
