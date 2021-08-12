require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    it 'userが紐付いていないと出品できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
    context '商品出品ができるとき' do
      it 'name,product_description,category,product_condition,shipping_charge,prefecture,shipping_dateが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'product_descriptionが空だと登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_condition_idが空だと登録できない' do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it 'shipping_charge_idが空だと登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idが空だと登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '¥300~¥9,999,999以外だと登録できない' do
        @item.price = '0~299 10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '半角英数字以外だと登録できない' do
        @item.price = 'aa ああ １１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
