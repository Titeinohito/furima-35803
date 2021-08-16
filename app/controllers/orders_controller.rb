class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirectinger

  def index
    @item = Item.find_by(id: params[:item_id])
    @order_buy_history = OrderBuyHistory.new
  end

  def new
    @order_buy_history = OrderBuyHistory.new
  end

  def create
    @order_buy_history = OrderBuyHistory.new(buy_history_params)
    if @order_buy_history.valid? && !params[:token].nil?
      pay_item
      @order_buy_history.save
      redirect_to root_path
    else
      @item = Item.find_by(id: params[:item_id])
      render action: :index
    end
  end

  private

  def buy_history_params
    params.require(:order_buy_history).permit(:post_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find_by(params[:item_id]).price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def redirectinger
    if current_user.id == Item.find_by(id: params[:item_id]).user.id
      redirect_to root_path
    elsif user_signed_in? == false
      redirect_to root_path
    elsif BuyHistory.find_by(item_id: params[:item_id]).present?
      redirect_to root_path
    end
  end
end
