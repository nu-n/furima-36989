require 'rails_helper'

RSpec.describe DestinationAddress, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  context '内容に問題ない場合' do
    it "tokenがあれば保存ができること" do
      expect(@address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @address.token = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
