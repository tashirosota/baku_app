class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title , comment: '状態 %(申請中 却下 友達)'
      t.date :date , comment: '開催日'
      t.time :open , comment: 'オープン時間'
      t.time :start , comment: 'スタート時間'
      t.integer :adv , comment: '前売り料金'
      t.integer :door , comment: '当日料金'
      t.text :concept , comment: 'コンセプト(概要に組み込む)'
      t.string :images , comment: 'フライヤーやタイムテーブルなの配列で格納'

      t.timestamps
    end
  end
end
