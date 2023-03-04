class ChangeCloumnsNotnullAddOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :customer_id, :integer, null: false
  end
end
