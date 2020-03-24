class Transaction < ApplicationRecord
  belongs_to :product
  belongs_to :purchaser, class_name: "User"
  belongs_to :card

  validates :product_id, :purchaser_id, :card_id, :status, presence: true
end