require 'rails_helper'

RSpec.describe User, type: :model do
describe 'ユーザー新規登録' do
  before do
    @user = FactoryBot.build(:user)
  end
  context '新規登録がうまくいくとき' do
    it 'nicknameとemail、passwordとpassword_confirmation、firstnameとlastname,firstname_kanaとlastname_kana,birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上であれば登録できる' do
    end
    it 'passwordとpassword_confirmationの値が一致している' do
    end
  end

  context '新規登録がうまくいかないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    end
    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'lastnameが空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    it 'firstname_kanaが空では登録できない' do
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it 'lastname_kanaが空では登録できない' do
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
end