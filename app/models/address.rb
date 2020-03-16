class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user

  validates :family_name_kanji, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/}

  validates :first_name_kanji, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/}

  validates :family_name_kana, presence: true,
    format: { with: /\A[ァ-ヶー－]+\z/}

  validates :first_name_kana, presence: true,
    format: { with: /\A[ァ-ヶー－]+\z/}

  validates :prefecture_id, format: { with: /\A[1-9][0-9]*\z/}

  validates :postal_code,         presence: true
  validates :municipalities,      presence: true
  validates :block_number,        presence: true
end