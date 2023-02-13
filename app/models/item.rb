class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_images, dependent: :destroy
  has_many :order_images, dependent: :destroy

  belongs_to :genre
end
