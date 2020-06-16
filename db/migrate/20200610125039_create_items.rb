class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,             null:false
      t.string      :size
      t.string      :condition,        null:false
      t.string      :shipping_method,  null:false
      t.string      :shipping_days,    null:false
      t.integer     :prefecture_id,    null:false
      t.integer     :shipping_price,   null:false
      t.integer     :price,            null:false
      t.text        :text,             null:false
      t.references  :seller
      t.references  :buyer
      t.references  :brand 
      t.references  :category,         foreign_key:true
      t.integer     :sale_status,      null: false, default: 0
      t.timestamps
    end
  end
end
