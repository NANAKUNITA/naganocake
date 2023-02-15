class Item < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true
  
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_one_attached :image
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image
   end
end
