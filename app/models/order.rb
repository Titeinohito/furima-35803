class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :post_code
    validates :area_id
    validates :municipality
    validates :house_number
    validates :phone_number
    validates :buy_history
  end

  belongs_to_active_hash :area

  belongs_to :buy_history
end
