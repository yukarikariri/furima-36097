require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全項目に情報を適切に入力して「会員登録」ボタンを押すと、ユーザーの新規登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@を含んでいない場合、登録できない' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが数字だけの場合、登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  is invalid.Include both letters and numbers')
      end

      it 'passwordが英字だけの場合、登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  is invalid.Include both letters and numbers')
      end

      it 'passwordに全角文字を含む場合、登録できない' do
        @user.password = 'あ1234a'
        @user.password_confirmation = 'あ1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  is invalid.Include both letters and numbers')
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致の場合、登録できない' do
        @user.password_confirmation = 'a12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameに漢字・ひらがな・カタカナ以外があるときは、登録できない' do
        @user.family_name = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name  is invalid.Input full-width characters')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameに漢字・ひらがな・カタカナ以外があるときは、登録できない' do
        @user.first_name = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name  is invalid.Input full-width characters')
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaにカタカナ以外があるときは、登録できない' do
        @user.family_name_kana = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana  is invalid.Input full-width katakana characters')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaにカタカナ以外があるときは、登録できない' do
        @user.first_name_kana = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana  is invalid.Input full-width katakana characters')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
