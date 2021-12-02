require 'rails_helper'

RSpec.describe DestinationAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @destination_address = FactoryBot.build(:destination_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@destination_address).to be_valid
      end
      it 'builing_nameは空でも保存できること' do
        @destination_address.building_name = ''
        expect(@destination_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @destination_address.post_code = ''
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @destination_address.post_code = '1234567'
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1では保存できないこと' do
        @destination_address.prefecture_id = 1
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @destination_address.city = ''
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @destination_address.address = ''
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @destination_address.phone_number = ''
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが10桁未満だと保存できないこと' do
        @destination_address.phone_number = '123456789'
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが11桁より多いと保存できないこと' do
        @destination_address.phone_number = '123456789012'
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが半角数値以外だと保存ができないこと' do
        @destination_address.phone_number = '１２３４５６７８９０'
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'userが紐付いていないと保存できないこと' do
        @destination_address.user_id = nil
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いていないと保存できないこと' do
        @destination_address.product_id = nil
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @destination_address.token = ''
        @destination_address.valid?
        expect(@destination_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
