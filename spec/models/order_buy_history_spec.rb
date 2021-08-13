require 'rails_helper'

RSpec.describe OrderBuyHistory, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:order_buy_history)
    end

    context '商品購入ができるとき' do
      it '商品を購入できる' do
        expect(@order).to be_valid
      end

      it '郵便番号が規定の値であれば登録できる' do
        @order.post_code = 000-0000
        except(@order).to be_valid
      end      

      it '電話番号が規定の値であれば登録できる' do
        @order.phone_number = 00000000000
        except(@order).to be_valid
      end

    end

    context '商品の購入ができないとき' do
      it '郵便番号が空のときに購入できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '郵便番号が規定の値ではないときに購入できない' do
        @order.post_code = 0
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '郵便番号が全角数字のときに購入することができない' do
        @order.post_code = '０００'
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '都道府県が空のときに購入できない' do
        @order.area_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '都道府県が規定の値未満のときでに購入できない' do
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '都道府県が規定の値より大きいときに購入できない' do
        @order.area_id = 100
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '市町村が空のときに購入できない' do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '番地が空のときに登録できない' do
        @order.house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '紐づくユーザーがないときに購入できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it '紐づく商品がないときに購入ができない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end

      it 'クレジットカードの情報がないときに登録できない' do
        @order.post_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include(" ")
      end
    end
  end
end
