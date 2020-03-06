class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address
  has_many :products
  has_many :cards
  has_many :transactions


  validates :nickname,:birthday_year,:birthday_month,:birthday_day , presence: true
         
  validates :email, format: { with: /\A[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]\z/i}
  
  validates :family_name_kanji, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]\z/i}

  validates :first_name_kanji, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]\z/i}

  validates :family_name_kana, presence: true,
    format: { with: /\A[^[ァ-ー]+$]\z/i}

  validates :first_name_kana, presence: true,
    format: { with: /\A[^[ァ-ー]+]$\z/i}

  validates :encrypted_password, confirmation: true,
    length: { minimum: 7, maximum: 100} 
end
