class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :leadtime
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :item_price
  end

  with_options numericality: { other_than: 0 , message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :leadtime_id
  end

  validates :item_price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }, inclusion: { in: 300..9_999_999, message: 'is out of setting range' }, format: { with: /\A[0-9]+\z/ }
end