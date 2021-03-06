class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :show, :destroy]
  before_action :product_purchase ,only: :edit

  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
  end 

  def edit
    unless current_user == @product.user
      redirect_to products_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @product.user
      @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  # def  done
  #   @product_purchaser= Product.find(params[:id])
  #   @product_purchaser.update( purchaser_id: current_user.id)
  #  end

  private
  def product_params
    params.require(:product).permit(:name, :image, :description, :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  # def ensure_current_user
  #   product = Product.find(params[:id])
  #   if product.user_id != current_user.id
  #     redirect_to action: :index
  #   end
  # end

  def set_product
    @product = Product.find(params[:id])
  end

  def product_purchase
     if @product.destination
      redirect_to root_path
     end
  end

  
end
