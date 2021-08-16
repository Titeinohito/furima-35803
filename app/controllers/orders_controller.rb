class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirectinger

  def index
    @item = item_find
    order
  end

  def create
    order(buy_history_params)
    if @order_buy_history.valid?
      pay_item
      @order_buy_history.save
      redirect_to root_path
    else
      @item = item_find
      render action: :index
    end
  end

  private

  def buy_history_params
    params.require(:order_buy_history).permit(:post_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item_find.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def redirectinger
    if current_user.id == item_find.user.id
      redirect_to root_path
    elsif BuyHistory.find_by(item_id: params[:item_id]).present?
      redirect_to root_path
    end
  end

  def order
    @order_buy_history = OrderBuyHistory.new
  end

  def item_find
    Item.find_by(id: params[:item_id])
  end
end
