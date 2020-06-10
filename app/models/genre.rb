class Genre < ApplicationRecord
  has_many :brands,through: :brand_genres
  has_many :brand_genres
end
