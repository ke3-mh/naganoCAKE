class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      ## ----------- カラムを追加　開始 ----------
      t.integer :unit_price,        null: false # 購入時単価（税込）
      t.integer :quantity,          null: false # 個数
      t.integer :status,            null: false, default: 0 # 製造ステータス
      ## ----------- カラムを追加　終了-----------
      t.timestamps
    end
  end
end
