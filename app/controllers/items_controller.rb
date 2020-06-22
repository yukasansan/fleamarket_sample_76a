class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Item.includes(:item_images).order(updated_at: "DESC")
  end
  
  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  
  def show
    @image = Item.includes(:item_images)

  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show      
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end


  private

  def item_params
    params.require(:item).permit(:name, :size, :condition, :shipping_method, :shipping_days, :prefecture_id, :shipping_price, :price, :text, :category_id, :brand_id, :seller_id, :buyer_id, :sale_status, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

end
