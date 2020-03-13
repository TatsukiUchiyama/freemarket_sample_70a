class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address
  accepts_nested_attributes_for :address
  has_many :products, dependent: :destroy
  has_one :card
  has_many :transactions
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :year
  belongs_to_active_hash :month
  belongs_to_active_hash :day

  validates :nickname, presence: true
  
  validates :year_id,:month_id,:day_id, format: { with: /\A[1-9][0-9]*\z/}




  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
   validates :family_name_kanji, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/}

   validates :first_name_kanji, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/}

  validates :family_name_kana, presence: true,
    format: { with: /\A[ァ-ヶー－]+\z/}

  validates :first_name_kana, presence: true,
    format: { with: /\A[ァ-ヶー－]+\z/}

  validates :password, confirmation: true,
    length: { minimum: 7, maximum: 100} 
end
