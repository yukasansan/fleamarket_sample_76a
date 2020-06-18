class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Item.includes(:item_images).order(updated_at: "DESC")
  end
  
  def new
  end
  
  def show
    @image = Item.includes(:item_images)
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

end
