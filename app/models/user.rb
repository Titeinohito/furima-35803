class User < ApplicationRecord

  length_password = /\A[a-z0-9]+\z/i
  length_name = /\A[ぁ-ゔァ-ヴ一-龥]+\z/
  length_name_kana = /\A[ァ-ヴ]+\z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, format: {length_name}
  validates :first_name_kana, presence: true, format: {length_name_kana}
  validates :last_name, presence: true, format: {length_name}
  validates :last_name_kana, presence: true, format: {length_name_kana}
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :encrypted_password, format: { with: length_password}

end
