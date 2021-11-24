require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '新規出品登録' do
    context '新規出品できるとき' do
      it 'name,price,description,condition_id,shipping_cost_id,shipping_days_id,prefecture_id,category_id,user_id,imageが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '新規出品できないとき' do
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it "価格が299円以下だと出品できない" do
        @product.price = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
        
      it "価格が9,999,999円以上だと出品できない" do
        @product.price = '10,000,000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
        
      it "価格が全角文字では登録できないこと" do
        @product.price = "３００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
        
      it "価格が半角英語だけでは登録できないこと" do
        @product.price = "aaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
        
      it "価格が半角英数混合では登録できないこと" do
        @product.price = "aaa111"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'condition_idが１では出品できない' do
        @product.condition_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_cost_idが１では出品できない' do
        @product.shipping_cost_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it 'shipping_day_idが１では出品できない' do
        @product.shipping_day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping days can't be blank")
      end

      it 'prefecture_idが１では出品できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'category_idが１では出品できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'userが紐付いていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end

      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end