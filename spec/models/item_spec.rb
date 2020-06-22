require 'rails_helper'

describe Item do
  describe "#create" do

    it "nameが空では登録できないこと" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "conditionが空では登録できないこと" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "shipping_methodが空では登録できないこと" do
      item = build(:item, shipping_method: "")
      item.valid?
      expect(item.errors[:shipping_method]).to include("を入力してください")
    end

    it "shipping_daysが空では登録できないこと" do
      item = build(:item, shipping_days: "")
      item.valid?
      expect(item.errors[:shipping_days]).to include("を入力してください")
    end

    it "prefecture_idが空では登録できないこと" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("を入力してください")
    end

    it "shipping_priceが空では登録できないこと" do
      item = build(:item, shipping_price: "")
      item.valid?
      expect(item.errors[:shipping_price]).to include("を入力してください")
    end

    it "priceが空では登録できないこと" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "textが空では登録できないこと" do
      item = build(:item, text: "")
      item.valid?
      expect(item.errors[:text]).to include("を入力してください")
    end

    it "seller_idが空では登録できないこと" do
      item = build(:item, seller_id: "")
      item.valid?
      expect(item.errors[:seller_id]).to include("を入力してください")
    end

    it "sale_statusが空では登録できないこと" do
      item = build(:item, sale_status: "")
      item.valid?
      expect(item.errors[:sale_status]).to include("を入力してください")
    end

  end
end