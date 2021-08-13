class OrdersController < ApplicationController
  before_action redirectinger
  before_action :authenticate_user!

  def index
    @item = Item.find_by(params[:id])
    @order_buy_history = OrderBuyHistory.new
  end

  def new
    @order_buy_history = OrderBuyHistory.new
  end

  def create
    @order_buy_history = OrderBuyHistory.new(buy_history_params)
    if @order_buy_history.valid?
      pay_item
      @order_buy_history.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def buy_history_params
    params.require(:order_buy_history).permit(:post_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find_by(params[:item_id]).price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def redirectinger
    redirect_to action: :index if current_user.id == Item.find_by(params[:id]).user_id
    redirect_to action: :index if params.id == BuyHistory.find_by(item_id: params[:id]).item.id
  end

end
