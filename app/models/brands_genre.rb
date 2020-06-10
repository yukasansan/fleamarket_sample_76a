class BrandsGenre < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :genre, optional: true
end
