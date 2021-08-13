require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item = FactoryBot.build(:item)
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
      it '299円以下では登録できない' do
        @item.price = 299 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '¥10,000,000以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '全角数字では登録できない' do
        @item.price = '１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '半角英数混合では登録できない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '半角英語だけでは登録できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it 'userが紐付いていないと出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'userが紐付いていないと出品できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'category_idが「1」では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'product_condition_idが「1」では登録できないこと' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it 'shipping_charge_idが「1」では登録できないこと' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it 'prefecture_idが「1」では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'shipping_date_idが「1」では登録できないこと' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end
    end
  end
end
