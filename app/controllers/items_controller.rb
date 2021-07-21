class ItemsController < ApplicationController

  

  #belongs_to

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    #binding.pry
     @item = Item.new(item_params)
    #binding.pry
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :descriptin, :categry_id, :condition_id, 
    :charges_id, :area_id, :ship_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
