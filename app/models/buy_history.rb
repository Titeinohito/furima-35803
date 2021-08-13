class BuyHistory < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :orders

  attr_accessor :token
end
