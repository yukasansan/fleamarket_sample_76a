class ItemsController < ApplicationController

  def index
    @item = Item.find(1)
  end
  
  def new
  end
  
  def index
  end

  def show
    @item = Item.find(params[:id])
  end

end
