class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :descriptin
    validates :categry_id
    validates :condition_id
    validates :charges_id
    validates :area_id
    validates :ship_day_id
    validates :price
  end

  belongs_to :area
  belongs_to :categry
  belongs_to :charge
  belongs_to :condition
  belongs_to :ship_day
  belongs_to :user
  has_one_attached :image

end
