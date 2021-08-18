require 'rails_helper'

RSpec.describe Formobject, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      @formobject = FactoryBot.build(:formobject, item_id: item.id)
      sleep 0.2
    end
    before do  
      user = FactoryBot.create(:user)
      @formobject = FactoryBot.build(:formobject, user_id: user.id)
      sleep 0.2
    end

    context '内容に問題ない場合' do
      it '郵便番号・都道府県・市区町村・番地・電話番号が正しく入力されていれば保存できること' do
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
      it 'building_nameが空だと登録できない' do
        @formobject.building_name = ''
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Building name can't be blank")
      end
      it 'telephone_numberが空だと登録できない' do
        @formobject.telephone_number = ''
        @formobject.valid?
        expect(@formobject.errors.full_messages).to include("Telephone number can't be blank")
      end
   end
  end
end




