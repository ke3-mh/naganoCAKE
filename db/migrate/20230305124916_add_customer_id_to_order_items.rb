class AddCustomerIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :customer_id, :integer
  end
end
