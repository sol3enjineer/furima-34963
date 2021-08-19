require 'rails_helper'

RSpec.describe Formobject, type: :model do
  describe '購入情報の保存' do
    before do  
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @formobject = FactoryBot.build(:formobject, user_id: user.id, item_id: item.id)
      sleep 1
    end

    context '内容に問題ない場合' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が正しく入力されていれば保存できること' do
        expect(@formobject).to be_valid
      end
      it 'building_nameが空でも購入ができる' do
          @formobject.building_name = ''
          expect(@formobject).to be_valid
      end
    end
  
    context '購入登録がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @formobject.postal_code = ''
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @formobject.postal_code = '1234567'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと登録できない' do
        @formobject.prefecture_id = ''
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「1」では登録できないこと' do
        @formobject.prefecture_id = '1'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalitiesが空だと登録できない' do
        @formobject.municipalities = ''
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと登録できない' do
        @formobject.address = ''
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと登録できない' do
        @formobject.telephone_number = ''
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下では購入できない' do
        @formobject.telephone_number = '12345678'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number is too short (minimum is 9 characters)")
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @formobject.telephone_number = '1234567891011'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number is too long (maximum is 12 characters)")
      end
      it 'telephone_numberが全角数字では登録できない' do
        @formobject.telephone_number = '１１１'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number is invalid", "Telephone number is too short (minimum is 9 characters)")
      end
      it 'telephone_numberが半角英数混合では登録できない' do
        @formobject.telephone_number = 'aaa111'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number is invalid", "Telephone number is too short (minimum is 9 characters)")
      end
      it 'telephone_numberが半角英語だけでは登録できない' do
        @formobject.telephone_number = 'aaaaa'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number is invalid", "Telephone number is too short (minimum is 9 characters)")
      end
      it 'tokenが空では購入できない' do
        @formobject.telephone_number = 'aaaaa'
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number is invalid", "Telephone number is too short (minimum is 9 characters)")
      end
      it 'userが紐づいていなければ購入できない' do
        @formobject.user_id = nil
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @formobject.item_id = nil
        @formobject.valid? 
        expect(@formobject.errors.full_messages).to include("Item can't be blank")
      end
   end
  end
end

