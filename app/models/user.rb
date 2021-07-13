class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birthday
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' is invalid.Input full-width characters' } do
    validates :family_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶ]+\z/, message: ' is invalid.Input full-width katakana characters' } do
    validates :family_name_kana
    validates :first_name_kana
  end

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: ' is invalid.Include both letters and numbers' }
end
