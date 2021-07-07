class User < ApplicationRecord

  length_password = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  length_name = /\A[ぁ-ゔァ-ヴ一-龠々]+\z/
  length_name_kana = /\A[ァ-ヴ]+\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, format: { with: length_name}
  validates :first_name_kana, presence: true, format: { with: length_name_kana}
  validates :last_name, presence: true, format: { with: length_name}
  validates :last_name_kana, presence: true, format: { with: length_name_kana}
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password,:password_confirmation, format: { with: length_password}

end
