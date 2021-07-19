class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :town, :house_number, :building_name, :phone_number, :user_id, :item_id,
                :token

  # バリデーション
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :town
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
    validates :phone_number, length: { minimum: 10, message: 'is too short' }
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  # 各テーブルへの処理
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, town: town, house_number: house_number,
                   building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
