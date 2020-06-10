class CreateBrandsGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :brands_genres do |t|
      t.references      :brand,      null:false, foreign_key:true
      t.references      :genre,      null:false, foreign_key:true
      t.timestamps
    end
  end
end
