class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_kana, :post_cord, :city, :address, presence: true

  validates_format_of :last_name, :first_name, with: /\A[一-龥]+\z/, message: "全角漢字で入力してください"
  validates_format_of :last_name_kana, :first_name_kana, with: /\A[ぁ-んー－]+\z/, message: "全角かなで入力してください"
  validates_format_of :post_cord, with: /\A\d{7}\z/, message: "7桁の半角数字を入力してください"
  validates_format_of :prefecture_id, :city, with: /\A[一-龥]+\z/, message: "全角漢字で入力してください"
end
