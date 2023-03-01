class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      ## ----------- カラムを追加　開始 ----------
      t.integer  :amount,               null: false # 数量
      ## ----------- カラムを追加　終了-----------
      t.timestamps
    end
  end
end