class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user

  PHONE_NUMBER  = /\A\d{10}\z|\A\d{11}\z/
  POSTAL_CODE   = /\A\d{3}[-]\d{4}\z|^\d{3}[-]\d{2}\z|^\d{3}\z|^\d{5}\z|^\d{7}\z/

  validates :family_name_kanji,   presence: true
  validates :first_name_kanji,    presence: true
  validates :family_name_kana,    presence: true
  validates :first_name_kana,     presence: true
  validates :postal_code,         presence: true, format: { with: POSTAL_CODE }
  validates :municipalities,      presence: true
  validates :block_number,        presence: true
  validates :phone_number,        presence: true, uniqueness: true, format: { with: PHONE_NUMBER }
end