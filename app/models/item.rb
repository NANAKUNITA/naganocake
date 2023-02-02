class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image
end
