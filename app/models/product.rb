class Product < ApplicationRecord
  has_many   :images
  belongs_to :category
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
