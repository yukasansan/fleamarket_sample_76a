class CardsController < ApplicationController

  before_action :set_card

  require "payjp"

  def index
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
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

  def new
    card = Card.find_by(user_id: current_user.id)
    redirect_to action: :index if card.present?
  end

  def create
    # Payjp.api_key = 'sk_test_06ee56e5ca37033cbed61eb7'
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    if params['payjp_token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp_token'],
      )
      
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
      redirect_to action: :new, notice: "削除しました"
    else
      redirect_to action: :index, alert: "削除できませんでした"
    end
  end

  private

  def set_card
    @card = Card.where(user: current_user).first if Card.where(user: current_user).present?
  end

end
