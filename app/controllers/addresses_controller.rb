class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_address, only: [:index, :create]
  before_action :product_purchase ,only: [:index]

  def index
    @destination_address = DestinationAddress.new
    if current_user == @product.user
      redirect_to root_path
    end
  end

  def create
    @destination_address = DestinationAddress.new(destination_params)
    if @destination_address.valid?
      pay_product
      @destination_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  

  private

  def destination_params
    params.require(:destination_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,product_id: params[:product_id],token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: destination_params[:token],
      currency: 'jpy'
    )
  end

  def set_address
    @product = Product.find(params[:product_id])
  end

  def product_purchase
    if @product.destination
     redirect_to root_path
    end
 end

end
