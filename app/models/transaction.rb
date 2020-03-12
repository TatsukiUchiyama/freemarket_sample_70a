class Transaction < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :card

  validates :product_id, :user_id, :card_id, :status, presence: true
end