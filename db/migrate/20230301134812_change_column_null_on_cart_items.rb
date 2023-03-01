class ChangeColumnNullOnCartItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :cart_items, :item_id, false
    change_column_null :cart_items, :customer_id, false
  end
end
