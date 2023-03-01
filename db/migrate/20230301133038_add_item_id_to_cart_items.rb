class AddItemIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :item_id, :integer
  end
end
