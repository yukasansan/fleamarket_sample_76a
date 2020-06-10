class Brand < ApplicationRecord
  has_many :items
  has_many :genres, through: :brand_genres
  has_many :brand_genres
end
