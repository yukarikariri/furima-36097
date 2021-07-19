require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: item.user_id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '入力必須項目に情報を適切に入力して「購入」ボタンを押すと、商品の購入ができる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_code(郵便番号)が空白のとき、登録できない' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_code(郵便番号)が「3桁-4桁」で入力されていない場合、登録できない' do
        @purchase_address.postal_code = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'postal_code(郵便番号)に全角文字が含まれる場合、登録できない' do
        @purchase_address.postal_code = "１２３-４５６７"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'postal_code(郵便番号)に半角英字が含まれる場合、登録できない' do
        @purchase_address.postal_code = "111-abcd"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it 'prefecture_id(都道府県)が「0(---)」のとき、登録できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'town(市区町村)が空白のとき、登録できない' do
        @purchase_address.town = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Town can't be blank")
      end

      it 'house_number(番地)が空白のとき、登録できない' do
        @purchase_address.house_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_number(電話番号)が空白のとき、登録できない' do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_number(電話番号)が10桁未満の場合、登録できない' do
        @purchase_address.phone_number = "123456789"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too short")
      end

      it 'phone_number(電話番号)が12桁以上の場合、登録できない' do
        @purchase_address.phone_number = "123456789012"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'phone_number(電話番号)に「-」が混入しているとき、登録できない' do
        @purchase_address.phone_number = "03-123-4567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'phone_number(電話番号)に全角文字が混入しているとき、登録できない' do
        @purchase_address.phone_number = "０９０１２３４５６７８"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'phone_number(電話番号)に半角英字が混入しているとき、登録できない' do
        @purchase_address.phone_number = "0901234567a"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'item_priceが空では登録できないこと' do
        @purchase_address.item_price = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item price can't be blank")
      end
    end
  end
end
