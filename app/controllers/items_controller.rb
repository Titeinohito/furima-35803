class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :redirecting, only: [:edit, :update, :destroy]

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
  end

  def edit
    redirect_to action: :index if BuyHistory.find_by(item_id: params[:id]).present?
  end

  def update
    if @item.update(item_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id,
                                 :charge_id, :area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirecting
    redirect_to action: :index if current_user.id != @item.user.id
  end
end
