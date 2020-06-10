class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text          :text,        null:false
      t.references    :item,        null:false, foreign_key:true
      t.integer       :buyer_id,    null:false, foreign_key:true
      t.integer       :seller_id,   null:false, foreign_key:true
      t.timestamps
    end
  end
end
