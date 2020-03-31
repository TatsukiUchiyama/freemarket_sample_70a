# README

# 接続先情報
URL http://18.179.74.63/

### ID/Pass
- ID: 70a
- Pass: 70a
## テスト用アカウント等
### 購入者用
- メールアドレス: test.test@gmail.com	
- パスワード: 1111111
### 購入用カード情報
- 番号：4242424242424242
- 期限：12/25
- セキュリティコード：123
### 出品者用
- メールアドレス名: seller@gmail.com
- パスワード: 1111111


# 70期_Aチーム_フリマアプリ DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
### Association
- has_one :address
- has_many :products
- has_one :card
- has_many :transactions

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name_kanji|string|null: false|
|first_name_kanji|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|municipalities|string|null: false|
|block_number|string|null: false|
|building_name|string||
|room_number|string||
|phone_number|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|brand|string||
|condition|string|null: false|
|shipping_payer|string|null: false|
|shipping_from_area|string|null: false|
|shipping_duration|string|null: false|
|price|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- belongs_to :user
- belongs_to :category

## transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|purchaser_id|integer|null: false, foreign_key: true|
|card_id|integer|null: false, foreign_key: true|
|status|integer|null: false|
### Association
- belongs_to :product
- belongs_to :user
- belongs_to :card

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products
