require 'rails_helper'

RSpec.describe OrderBuyHistory, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, :skip_validate)
      @order = FactoryBot.build(:order_buy_history, user_id: @user.id, item_id: @item.id)
    end

    context '商品購入ができるとき' do
      it '商品を購入できる' do
        expect(@order).to be_valid
      end

      it '郵便番号が規定の値であれば登録できる' do
        @order.post_code = '123-4567'
        expect(@order).to be_valid
      end

      it '電話番号が規定の値であれば登録できる' do
        @order.phone_number = '12345678901'
        expect(@order).to be_valid
      end

      it '建物名がなくても登録できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品の購入ができないとき' do
      it '郵便番号が空のときに購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号が規定の値ではないときに購入できない' do
        @order.post_code = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid')
      end

      it '郵便番号が全角数字のときに購入することができない' do
        @order.post_code = '０００'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid')
      end

      it '都道府県が空のときに購入できない' do
        @order.area_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end

      it '都道府県が規定の値未満のときでに購入できない' do
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include('Area must be greater than or equal to 2')
      end

      it '都道府県が規定の値より大きいときに購入できない' do
        @order.area_id = 100
        @order.valid?
        expect(@order.errors.full_messages).to include('Area must be less than or equal to 48')
      end

      it '市町村が空のときに購入できない' do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空のときに登録できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空のとき購入できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が規定の値以上のとき購入できない' do
        @order.phone_number = '100000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が規定の値以下のとき購入できない' do
        @order.phone_number = '100000000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が英数混合のとき購入できない' do
        @order.phone_number = '123456789ab'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '紐づくユーザーがないときに購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it '紐づく商品がないときに購入ができない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it 'カード情報が正常ではないときに購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
