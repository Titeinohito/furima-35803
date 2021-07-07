require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができるとき' do

      it "ユーザー登録ができる" do
        expect(@user).to be_valid
      end

      it "パスワードが６文字以上であれば登録できる" do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end

      it "パスワードに英数字が両方あるときに登録できる" do
        @user.password = 'a12345'
        @user.password_confirmation ='a12345'
        expect(@user).to be_valid
      end

      it "名前がかな全角カナ漢字のときに登録できる" do
        @user.last_name = 'あア阿'
        expect(@user).to be_valid
      end

      it "名字がかな全角カナ漢字びときに登録できる" do
        @user.first_name ='あア阿'
        expect(@user).to be_valid
      end
      
      it "名前のカナが全角カナのときに登録できる" do
        @user.last_name_kana = 'アアア'
        expect(@user).to be_valid
      end

      it "名字のカナが全角カナのときに登録できる" do
        @user.first_name_kana = 'アアア'
        expect(@user).to be_valid
      end

    end

    context 'ユーザー登録ができないとき' do

      it "ニックネームが空のときに登録できない" do
        @user.nickname = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "パスワードがからのときに登録できない" do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードが５文字以下の時に登録できない" do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "パスワードが英字のときに登録できない" do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードが数字だけのときに登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードが全角のときに登録できない" do
        @user.password = 'ａｂｃｄｅｆ１'
        @user.password_confirmation = 'ａｂｃｄｅｆ１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワード確認が空のときに登録できない" do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation is invalid")
      end

      it "メールアドレスが空のときに登録することができない" do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "名前が空のときに登録できない" do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "名字が空のときに登録できない" do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "名前のカナが空のときに登録できない" do
        @user.last_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "名前のカナが全角カナ以外のときに登録できない" do
        @user.last_name_kana = 'あああ'
        @user.valid?
      end

      it "名字のカナが空のときに登録できない" do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "名字のカナが全角カナ以外のときに登録できない" do
        @user.first_name_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "誕生日がからのときに登録できない" do
        @user.birthday = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
      it "重複したメールアドレスがあるときに登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスに@を含める必要がある" do
        @user.email = "abc123456789"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

    end

  end

end
