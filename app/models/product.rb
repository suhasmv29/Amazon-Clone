class Product < ApplicationRecord
  belongs_to :category
  validates :title, :description, :image_url,  presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.1}
  validates :title, uniqueness: true
  
end
