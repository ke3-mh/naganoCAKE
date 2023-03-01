class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
end
