class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      ## ----------- カラムを追加　開始 ----------
      t.string  :name,               null: false # ジャンル名
      ## ----------- カラムを追加　終了-----------
      t.timestamps
    end
  end
end
