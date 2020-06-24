class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # belongs_to :user
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true

  belongs_to :category
  belongs_to :brand, optional: true
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # item_imagesモデルの属性付
  has_many :item_images, inverse_of: :item, dependent: :destroy
  accepts_nested_attributes_for :item_images ,allow_destroy: true


  validates :name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :condition, :shipping_method, :shipping_days, :prefecture_id, :shipping_price, :price, :seller_id, :sale_status, presence: true
  validates :price, presence: true, inclusion: 300..9999999

  def self.search(search)
    if search
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
