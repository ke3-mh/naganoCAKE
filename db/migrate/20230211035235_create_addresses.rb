class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      ## ----------- カラムを追加　開始 ----------
      t.string :name,               null: false # 宛名
      t.string :postal_code,        null: false # 郵便番号
      t.string :address,            null: false # 住所
      ## ----------- カラムを追加　終了-----------
      t.timestamps
    end
  end
end
