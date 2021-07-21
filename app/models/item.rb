class Item < ApplicationRecord

  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :descriptin, length: {maximum: 1000}
    validates :price, numericality: {in: 300..9999999}, format: { with: /\A[0-9]+\z/}
    validates :image
  end
  with_options format: { without: /1/ } do
    validates :categry_id
    validates :condition_id
    validates :charges_id
    validates :area_id
    validates :ship_day_id
  end


  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :area
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_day
  belongs_to             :user
  has_one_attached       :image

end
