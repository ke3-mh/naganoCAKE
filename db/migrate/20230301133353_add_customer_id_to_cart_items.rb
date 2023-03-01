class AddCustomerIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :customer_id, :integer
  end
end
