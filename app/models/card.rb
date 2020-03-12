class Card < ApplicationRecord
  belongs_to :user

  validates :customer_id, :user_id, :card_id, presence: true
end
