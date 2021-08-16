class OrderBuyHistory
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :buy_history_id, :user_id,
                :item_id, :token

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    # Order
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :area_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 48 }
    validates :municipality
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }

    # Buy_history
    validates :user_id
    validates :item_id

    validates :token
  end

  def save
    buy_history = BuyHistory.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, area_id: area_id, municipality: municipality, house_number: house_number,
                 building_name: building_name, phone_number: phone_number, buy_history_id: buy_history.id)
  end
end
