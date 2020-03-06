class Transaction < ApplicationRecord
  belongs_to :product
  belongs_to :user
  belongs_to :card
end
