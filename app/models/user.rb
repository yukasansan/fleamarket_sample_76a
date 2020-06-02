class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items, dependent: :destroy
  has_many :buyer_items, class_name: 'Item', foreign_key: 'buyer_id', dependent: :destroy
  has_many :seller_items, class_name: 'Item', foreign_key: 'seller_id', dependent: :destroy
  
  # has_many :messages, dependent: :destroy
  has_many :buyer_messages, class_name: 'Message', foreign_key: 'buyer_id', dependent: :destroy
  has_many :seller_messages, class_name: 'Message', foreign_key: 'seller_id', dependent: :destroy

  has_one :address, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one :card

  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthyear, :birthmonth, :birthday, :telephone, presence: true
end
