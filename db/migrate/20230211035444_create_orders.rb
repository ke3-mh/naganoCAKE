class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      ## ----------- カラムを追加　開始 ----------
      t.string :postal_code,        null: false # 配送先郵便番号
      t.string :address,            null: false # 配送先住所
      t.string :name,               null: false # 宛名
      t.integer :shipping_cost,     null: false # 送料
      t.integer :payment_method,    null: false # 支払方法
      t.integer :amount_paid,       null: false # 支払金額
      t.integer :status,            null: false # 注文ステータス
      ## ----------- カラムを追加　終了-----------
      t.timestamps
    end
  end
end
