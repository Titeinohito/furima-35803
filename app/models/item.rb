class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :descriptin, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    validates :category_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 11 }
    validates :condition_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 7 }
    validates :charge_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 3 }
    validates :area_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 48 }
    validates :ship_day_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 4 }
    validates :user
  end

  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_day
  belongs_to             :user
  has_one_attached       :image
end
