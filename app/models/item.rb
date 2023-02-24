class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_images, dependent: :destroy
  has_many :order_images, dependent: :destroy

  # belongs_to :genre ジャンル機能

  # バリデーション
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

  def hoge(price)
    return ((price + (price*0.1)).to_i).to_s(:delimited)
  end

end
