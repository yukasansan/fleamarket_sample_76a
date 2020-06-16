class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Item.all
    @items = Item.includes(:images).order(updated_at: "DESC")
  end
  
  def new
  end
  
  def show
    @item = Item.find(params[:id])
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

end
