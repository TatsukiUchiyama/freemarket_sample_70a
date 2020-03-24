class ProductsController < ApplicationController

before_action :move_to_index, only: [:edit, :update]

before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.includes(:images, :category, :seller).order('created_at DESC')
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
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: params[:parent_id], ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end
  

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def show
    @user = @product.seller
    @category = @product.category
  end

  def edit
    @product.images
    @category_parent_array = Category.where(ancestry: nil)
    @product_root_category = @product.category.root
    @product_children_category = @product_root_category.children
    product_parent_category = @product.category.parent
    @product_grandcildren_category = product_parent_category.children

  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end 
    
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition_id, :brand, :shipping_payer_id, :shipping_from_area_id, :shipping_duration_id, :price, :category_id, images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def move_to_index
    @product = Product.find_by(params[:id])
    redirect_to action: :index unless user_signed_in? || current_user.id != @product.seller_id 
  end

  def set_product
    @product = Product.find(params[:id])
  end

end