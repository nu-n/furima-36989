class DestinationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :address, :user_id, :product_id, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code,      format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number,   format: { with: /\A\d{10,11}\z/, message: "is invalid."}
    
  end

  validates :prefecture_id,                   numericality: { other_than: 1, message: "can't be blank" }
  validates :token,           presence: true

  def save
    destination = Destination.create(product_id: product_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, destination_id: destination.id)
  end
end
