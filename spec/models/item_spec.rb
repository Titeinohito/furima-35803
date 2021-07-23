require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '商品出品' do

    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/star.png')
    end

    context '商品出品ができるとき' do
      
      it '登録ができる' do
        expect(@item).to be_valid
      end

      it '名前が規定の文字数内であれば登録できる' do
        @item.name = "aaaaaaaaaaaaa"
        expect(@item).to be_valid
      end
      
      it '説明が規定の文字数内であれば登録できる' do
        @item.descriptin = "aaaaaaaaaaaaa"
        expect(@item).to be_valid
      end

      it 'カテゴリーのIDが規定の数値であれば登録できる' do
        @item.categry_id = 2
        expect(@item).to be_valid
      end

      it 'コンディションのIDが規定の数値であれば登録できる' do
        @item.condition_id = 2
        expect(@item).to be_valid
      end

      it '手数料のIDが規定の数値であれば登録できる' do
        @item.charges_id = 2
        expect(@item).to be_valid
      end

      it '地域のIDが規定の値であれば登録できる' do
        @item.area_id = 2
        expect(@item).to be_valid
      end

      it '日数のIDが規定の値であれば登録できる' do
        @item.ship_day_id = 2
        expect(@item).to be_valid
      end

      it '値段の値が規定の範囲内であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

    end

    context '商品の出品ができないとき' do
      
      it '名前が空のときに登録できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '名前の文字数が規定の範囲を超えた場合登録できない' do
        tester = 'a' * 100
        @item.name = tester
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it '説明が空のときに登録できない' do
        @item.descriptin = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Descriptin can't be blank")
      end

      it '説明の文字数が規定の値を超えた場合に登録できない' do
        tester = 'a' * 1100
        @item.descriptin = tester
        @item.valid?
        expect(@item.errors.full_messages).to include("Descriptin is too long (maximum is 1000 characters)")
      end

      it 'カテゴリーが空のときに登録できない' do
        @item.categry_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Categry can't be blank")
      end

      it 'カテゴリーが規定の値以下のときに登録できない' do
        @item.categry_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categry must be greater than or equal to 2")
      end

      it 'カテゴリーが規定の値以上のときに登録できない' do
        @item.categry_id = 50
        @item.valid?
        expect(@item.errors.full_messages).to include("Categry must be less than or equal to 11")
      end

      it 'コンディションが空のときに登録できない' do
        @item.condition_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'コンディションが規定の値以下のときに登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be greater than or equal to 2")
      end

      it 'コンディションが規定の値以上のときに登録できない' do
        @item.condition_id = 50
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be less than or equal to 7")
      end

      it '送料が空のときに登録できない' do
        @item.charges_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Charges can't be blank")
      end

      it '送料が規定の値以下のときに登録できない' do
        @item.charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charges must be greater than or equal to 2")
      end

      it '送料が規定の値以上のときに登録できない' do
        @item.charges_id = 50
        @item.valid?
        expect(@item.errors.full_messages).to include("Charges must be less than or equal to 3")
      end

      it '地域が空のときに登録できない' do
        @item.area_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it '地域が規定の値以下のときに登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be greater than or equal to 2")
      end

      it '地域が規定の値以上のときに登録できない' do
        @item.area_id = 50
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be less than or equal to 48")
      end

      it '画像がないときに登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '値段が空のときに登録できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '値段が規定の値以下のときに登録できない' do
        @item.price = 20
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '値段が規定の値以上のときに登録できない' do
        @item.price = 1000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

    end

  end
  
end
