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
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていない場合、登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end
    it '数字のみでは登録できないこと' do
      @user.password = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it '英語のみでは登録できないこと' do
      @user.password = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it '全角文字では登録できないこと' do
      @user.password = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'firstnameが空では登録できない' do
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'firstnameが漢字、ひらがな、カタカナ以外の場合では登録できない' do
      @user.firstname = 'aaascde１２３'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'lastnameが空では登録できない' do
      @user.lastname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    it 'lastnameが漢字、ひらがな、カタカナ以外の場合では登録できない' do
      @user.firstname = 'aaascde１２３'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    
    it 'firstname_kanaが空では登録できない' do
      @user.firstname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it 'firstnameが全角カタカナ以外では登録できない' do
      @user.firstname_kana = 'あああ aaa 111'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it 'lastname_kanaが空では登録できない' do
      @user.lastname_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
    end
    it 'lastnameが全角カタカナ以外では登録できない' do
      @user.lastname_kana = 'あああ aaa 111'
      @user.valid?
      binding.pry
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