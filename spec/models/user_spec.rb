require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
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

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        user.valid?
        expect(@user.errors.full_messages).to include("last_name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        user.valid?
        expect(@user.errors.full_messages).to include("first_name can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kanae = ''
        user.valid?
        expect(@user.errors.full_messages).to include("last_name_kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kanae = ''
        user.valid?
        expect(@user.errors.full_messages).to include("first_name_kana can't be blank")
      end

      it 'birth_dayが空だと登録できない' do
        @user.birth_day = ''
        user.valid?
        expect(@user.errors.full_messages).to include("birth_day can't be blank")
      end
    end
  end
end
