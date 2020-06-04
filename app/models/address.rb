class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_name_kana, :post_cord, :city, :address, presence: true
end
