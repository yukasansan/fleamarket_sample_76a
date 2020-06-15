require 'rails_helper'

describe Card do
  describe '#create' do

    #customer_idがなければ登録できない
    it 'is invalid without customer_id' do
      # user = create(:user)
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end
    
    #card_idがなければ登録できない
    it 'is invalid without card_id' do
      # user = create(:user)
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end
