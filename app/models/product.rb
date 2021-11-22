class Product < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_day
  # has_one :address
  belongs_to :user

  validates :name,                    presence: true
  validates :price,                   presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :description,             presence: true
  validates :condition_id,                            numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_id,                        numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_days_id,                        numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,                           numericality: { other_than: 1 , message: "can't be blank"}
  validates :category_id,                             numericality: { other_than: 1 , message: "can't be blank"}
  validates :image,                   presence: true

  # priceが半角数字であること numaricality
  # priceが300−99999999の間であること validates_inclusion_of
  # Activehashの５つの項目はid１以外を選択していること other_than

end
