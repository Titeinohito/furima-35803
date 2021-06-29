class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatabl, password_length: 6

  validatable :first_name, presence: true
  validatable :first_name_kana, presence: true
  validatable :last_name, presence: true
  validatable :last_name_kana, presence: true
  validatable :nickname, presence: true
  validatable :birthday, presence: true

end
