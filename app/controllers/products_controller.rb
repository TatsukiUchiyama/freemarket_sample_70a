class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images, :category, :user).order('created_at DESC')
    @ham = Product.where(brand: '伊藤ハム')

  end


  def category
    @categories = Category.where(ancestry: nil)
    respond_to do |format|
      format.json
    end
  end

  def category_children
    @category_children = Category.find(params[:id]).children
    respond_to do |format|
      format.json
    end
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:id]).children
    respond_to do |format|
      format.json
    end
  end


  def new
    @product = Product.new
    @product.images.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @user = @product.user
    @category = @product.category
  end

  def edit
  end

  def update
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to root_path
    else
      render :show
    end 
    
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition_id, :brand, :shipping_payer_id, :shipping_from_area_id, :shipping_duration_id, :price, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

end