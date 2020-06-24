class CardsController < ApplicationController

  require "payjp"

  before_action :set_card
  before_action :set_key, only: [:index, :create, :destroy, :confirmation]
  before_action :retrieve_card, only: [:index, :confirmation]
  before_action :set_item, only: [:confirmation, :pay, :complete]

  def index
  end

  def new
    card = Card.find_by(user_id: current_user.id)
    redirect_to action: :index if card.present?
  end

  def create
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp_token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to mypage_index_path
      else
        redirect_to action: "create"
      end
    end
  end


  def destroy
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: :new
    else
      redirect_to action: :index
    end
  end

  def confirmation
    redirect_to user_session_path unless user_signed_in?
    @images = @item.item_images.all
  end

  def pay
    Payjp::Charge.create(
      amount: @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      customer: @card.customer_id, #顧客ID
      currency: 'jpy', #日本円
      )
      # 購入者のidをDBに反映
      @item.update(buyer_id: current_user.id)

      redirect_to action: :complete
  end

  def complete
  end

  private

  def set_card
    @card = Card.where(user: current_user).first if Card.where(user: current_user).present?
  end

  def set_key  #秘密鍵の設定
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
  end

  def retrieve_card  #登録されたカードから情報を引き出すメソッド
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)

      @card_brand = @card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "card/visa.svg"
      when "JCB"
        @card_src = "card/jcb.svg"
      when "MasterCard"
        @card_src = "card/master-card.svg"
      when "American Express"
        @card_src = "card/american_express.svg"
      when "Diners Club"
        @card_src = "card/dinersclub.svg"
      when "Discover"
        @card_src = "card/discover.svg"
      end
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
