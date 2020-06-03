##usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|	
|email|string|null: false,unique:true|
|first_name|string|null: false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthyear|string|null:false|
|birthmonth|string|null:false|
|birthday|string|null:false|
|telephone|string|null:false|
|icon|text|	
|text|text|null:false|

##Association
- has_one:address, dependent: :destroy
- has_many:messages, dependent:  :destroy
- has_many:items, dependent: :destroy
- has_many:comments, dependent: :destroy
- has_many:likes, dependent: :destroy

##addressテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|post_cord|integer|null:false|
|prefecture_id|string|null:false|
|city|string|null:false|
|address|string|null:false|
|building|text|	
|telephone|string|	
|user_id|integer|null:false,foreign_key:true|

##Association
- belongs_to:user

##likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false,foreign_key:true|
|user_id|integer|null:false,foreign_key:true|

##Association
- belongs_to:item belongs_to:user

##itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|size|string|	
|condition|string|null:false|
|shipping_method|string|null:false|
|shipping_days|string|null:false|
|shipping_area|string|null:false|
|shipping_price|integer|null:false|
|price|integer|null:false|
|text|text|null:false|
|seller_id|integer|null:false|
|buyer_id|integer|
|brand_id|integer|	
|category_id|references|null:false,foreign_key:true|
|prefecture_id|integer|null:false|
|sale_status|string|null:false|

##Association
- belongs_to:user belongs_to:category, dependent: :destroy 
- has_many:item_images, dependent: :destroy
- has_many:messages, dependent: :destroy belongs_to:bland, dependent: :destroy 
- has_many:likes, dependent: :destroy has_many:comments, dependent: :destroy

##categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|

##Association
- has_many:items

##item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|	
|item_id|integer|null:false,foreign_key:true|

##Association
- belongs_to:item

##commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|item_id|integer|null:false,foreign_key:true|
|user_id|integer|null:false,foreign_key:true|

##Association
- belongs_to:item belongs_to:user

##messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|item_id|integer|null:false,foreign_key:true|
|buyer_id|integer|null:false,foreign_key:true|
|seller_id|integer|null:false,foreign_key:true|

##Association
- belongs_to:item belongs_to:user

##brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

##Association
- has_many:items has_many:genres,through: :brands_genres
- has_many:brands_genres

##brands_genresテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null:false,foreign_key:true|
|genre_id|integer|null:false,foreign_key:true|

##Association
- belongs_to:brand belongs_to:genre

##genresテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

##Association
- has_many:brands,through: :brands_genres has_many:brands_genres