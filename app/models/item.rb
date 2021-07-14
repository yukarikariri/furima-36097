class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :lead_time
  belongs_to :user

  with_options presence: true
    validates :item_name
    validates :item_description
    validates :item_price
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :leadtime_id
  end
end