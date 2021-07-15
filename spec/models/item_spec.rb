require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it '全項目に情報を適切に入力して「出品する」ボタンを押すと、商品の登録ができる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない' do
      it 'image(商品画像)が添付されていない場合、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_name(商品名)が空白のとき、登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_description(商品説明)が空白のとき、登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'category_id(カテゴリー)が「0(---)」のとき、登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_id(商品の状態）が「0(---)」のとき、登録できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'condition_id(配送料の負担）が「0(---)」のとき、登録できない' do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it 'prefecture_id(発送元の地域）が「0(---)」のとき、登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'leadtime_id(発送までの日数）が「0(---)」のとき、登録できない' do
        @item.leadtime_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Leadtime can't be blank")
      end

      it 'item_price(販売価格）が空白のとき、登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_price(販売価格）が299円以下のとき、登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end

      it 'item_price(販売価格）が10,000,000円以上のとき、登録できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end

      it 'item_price(販売価格）に全角文字を含む場合、登録できない' do
        @item.item_price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end

      it 'item_price(販売価格）に半角英数字混合では出品できない' do
        @item.item_price = '3000yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end

      it 'item_price(販売価格）に半角英字のみでは出品できない' do
        @item.item_price = 'yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end

      it 'ユーザー情報がない場合、出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end
