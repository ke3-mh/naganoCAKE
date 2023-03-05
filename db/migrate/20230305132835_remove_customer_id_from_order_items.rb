class RemoveCustomerIdFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :customer_id, :integer
  end
end
