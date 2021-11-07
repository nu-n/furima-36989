require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      user = User.new(nickname: '', last_name: '', first_name: '', last_name_kana: '', first_name_kana: '', birth_day: '',
                      email: 'kkk@gmail.com', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank", "Last name can't be blank",
                                                   "First name can't be blank", "Last name kana can't be blank", "First name kana can't be blank", "Birth day can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'abe', last_name: 'abe', first_name: 'abe', last_name_kana: 'abe', first_name_kana: 'abe',
                      birth_day: '1975.1.27', email: '', password: '00000000', password_confirmation: '00000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
