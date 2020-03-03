# README

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
|family_name_kanji_destination|string|null: false|
|first_name_kanji_destination|string|null: false|
|family_name_kana_destination|string|null: false|
|first_name_kana_destination|string|null: false|
|postal_code|string|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|block_number|string|null: false|
|building_name|string||
|room_number|string||
|phone_number|string||
### Association
- has_many :products

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
|user_id|integer|null: false|
### Association
- has_many :products_categories
- has_many :categories,  through: :products_categories

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product

## products_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :category

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|catergory|string|null: false|
|sub_catergory|string|null: false|
|sub_sub_catergory|string|null: false|
### Association
- has_many :products_categories
- has_many :products,  through: :products_categories
