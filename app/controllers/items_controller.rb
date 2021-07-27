class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to action: :index
    else
      render action: :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id,
                                 :charge_id, :area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
