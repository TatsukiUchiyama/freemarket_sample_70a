class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address
  has_many :products
  has_many :cards
  has_many :transactions
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :year
  belongs_to_active_hash :month
  belongs_to_active_hash :day
  # has_secure_password validations: true

  validates :nickname,:year_id,:month_id,:day_id, presence: true
         
  # validates :email, format: { with: /\A[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]\z/i}
  
  validates :family_name_kanji, presence: true
    # format: { with: /\A[ぁ-んァ-ン一-龥]\z/i}

  validates :first_name_kanji, presence: true
    # format: { with: /\A[ぁ-んァ-ン一-龥]\z/i}

  validates :family_name_kana, presence: true
    # format: { with: /\A[^[ァ-ー]+$]\z/i}

  validates :first_name_kana, presence: true
    # format: { with: /\A[^[ァ-ー]+]$\z/i}

  validates :password, confirmation: true,
    length: { minimum: 7, maximum: 100} 
end
