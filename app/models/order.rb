class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :post_code
    validates :area_id
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :user
  end

  belongs_to_active_hash :area
  
  belongs_to :user
  has_many :buy_history
end
