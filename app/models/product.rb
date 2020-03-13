class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_duration
  # belongs_to_active_hash :shipping_payer
  belongs_to_active_hash :condition
  has_many   :images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true
  # validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
