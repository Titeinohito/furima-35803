class User < ApplicationRecord
  length_password = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  length_name = /\A[ぁ-ゔァ-ヴ一-龠々ー]+\z/
  length_name_kana = /\A[ァ-ヴ]+\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    with_options format: { with: length_name } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: length_name_kana } do
      validates :first_name_kana
      validates :last_name_kana
    end
    validates :nickname
    validates :birthday
  end

  validates :password, :password_confirmation, format: { with: length_password }

  has_many :items
  has_many :buy_history
end
