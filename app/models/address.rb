class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code
    validates :town
    validates :house_number
    validates :building_name
    validates :phone_number
  end

  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :prefecture_id
  end

end
