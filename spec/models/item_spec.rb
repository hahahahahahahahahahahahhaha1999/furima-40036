require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品する' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '登録できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '登録できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'categoryのidが0では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it 'item_conditionのidが0では登録できない' do
        @item.item_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 0")
      end

      it 'postageのidが0では登録できない' do
        @item.postage_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 0")
      end

      it 'prefectureのidが0では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'shipping_timeのidが0では登録できない' do
        @item.shipping_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time must be other than 0")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299以下だと登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it 'priceが10000000以上だと登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it 'priceが数字以外だと登録できないこと' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
