# README　このアプリについて

***

## 🎁Fmarket（メルカリコピーサイト）とは
プログラミングスクールTECH::EXPERT76期最終課題制作物。 スクラム（チーム4人）によるアジャイル開発により制作。 メルカリの機能である新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能などを忠実に再現した。

## 📝概要
- アプリ名：Fleamarket
- 使用言語：HTML/CSS/Ruby/Rails/JavaScript/jQuery/MySQL/AWS/Github/Visual Studio Code
- 機能：新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能・パンくず機能
- 作業人数：4人
- 作業期間：約4週間
- タスク管理：Trello
## 🌍URL
URL：http://18.180.133.238/
Basic認証をかけています。閲覧時は以下のIDとPassを入力してください。

### 🔒ID&Pass
- ID: team_a
- Pass:team_a_76
## 📝テスト用アカウント
### 💰購入者アカウント
- メール：buyer_user76@gmail.com
- パスワード: buyer_user76
### 💳購入用カード情報
- 番号：4242424242424242
- 期限：2021年01月
セキュリティコード：123
### 🎁出品者用アカウント
- メール：seller_user76@gmail.com
- パスワード：seller_user76

## 💻機能詳細

##                 〜トップページ〜
CSSのみを使ったドロップダウンメニューやiQueryのslickを使ったスライドショーがある。
![Alt Text](https://gyazo.com/68dba537b6f681230e06c9c000900803.gif)


##                 〜新規会員登録機能〜
個人情報と住所とクレジットカード情報を登録する事で会員登録できる。
![Alt Text](https://gyazo.com/bbaef71d3018ddfcac41138007b41e76.gif)



##                 〜商品出品機能〜

会員登録すれば商品を出品する事ができる。商品画像は10枚まで登録できる。商品の状態や発送方法などを細かく設定できる。
![Alt Text](https://gyazo.com/7b03eaeee0e4515bc253089469521029.gif)


##                 〜商品詳細ページ〜

iQueryのslickを使ったサムネイルつきスライドショーがある。商品の状態や配送元などを詳しく見る事ができる

![Alt Text](https://gyazo.com/75d57323cd045ac8c9f1b7ceb83703d3.gif)

##                 〜商品編集ページ〜
商品画像と商品情報の追加・削除・変更が行える。
![Alt Text](https://gyazo.com/fb607ae525f37a8510592844dd8df330.gif)


##                 〜商品購入機能〜
仮想クレジットPayjpを使い仮想的に商品購入できる。購入した商品にはSOLDマークがつき購入できなくなる。
![Alt Text](https://gyazo.com/5bffa5b51113b7b384fd1591c84e7d24.gif)


## 📝DB設計


## usersテーブル
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

Association
- has_one:address, dependent: :destroy
- has_many:messages, dependent:  :destroy
- has_many:items, dependent: :destroy
- has_many:comments, dependent: :destroy
- has_many:likes, dependent: :destroy

## addressテーブル
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

Association
- belongs_to:user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null:false,foreign_key:true|
|user_id|integer|null:false,foreign_key:true|

Association
- belongs_to:item belongs_to:user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|size|string|	
|condition|string|null:false|
|shipping_method|string|null:false|
|shipping_days|string|null:false|
|shipping_price|integer|null:false|
|price|integer|null:false|
|text|text|null:false|
|seller_id|integer|null:false|
|buyer_id|integer|
|brand_id|integer|	
|category_id|references|null:false,foreign_key:true|
|prefecture_id|integer|null:false|
|sale_status|string|null:false|

Association
- belongs_to:user belongs_to:category, dependent: :destroy 
- has_many:item_images, dependent: :destroy
- has_many:messages, dependent: :destroy belongs_to:bland, dependent: :destroy 
- has_many:likes, dependent: :destroy has_many:comments, dependent: :destroy

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|

Association
- has_many:items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|	
|item_id|integer|null:false,foreign_key:true|

Association
- belongs_to:item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|item_id|integer|null:false,foreign_key:true|
|user_id|integer|null:false,foreign_key:true|

Association
- belongs_to:item belongs_to:user

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|item_id|integer|null:false,foreign_key:true|
|buyer_id|integer|null:false,foreign_key:true|
|seller_id|integer|null:false,foreign_key:true|

Association
- belongs_to:item belongs_to:user

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

Association
- has_many:items has_many:genres,through: :brands_genres
- has_many:brands_genres

## brands_genresテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|integer|null:false,foreign_key:true|
|genre_id|integer|null:false,foreign_key:true|

Association
- belongs_to:brand belongs_to:genre

## genresテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

Association
- has_many:brands,through: :brands_genres has_many:brands_genres

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false|
|customer_id|integer|null:false|
|card_id|integer|null:false|

Association
- belongs_to :user

## residencesテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture_id|integer|null:false|
|city|text|null:false|

Association
- belongs_to_active_hash :prefecture
