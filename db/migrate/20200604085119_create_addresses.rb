class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string       :first_name,         null: false
      t.string       :last_name,          null: false
      t.string       :first_name_kana,    null: false
      t.string       :last_name_kana,     null: false
      t.integer      :post_cord,          null: false
      t.string       :city,               null: false
      t.string       :address,            null: false
      t.text         :building
      t.string       :telephone
      t.string       :prefecture_id,      null: false
      t.references   :user,               null: false, foreign_key:true
      t.timestamps
    end
  end
end
