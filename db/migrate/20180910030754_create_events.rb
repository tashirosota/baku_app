class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title , comment: 'タイトル'
      t.date :date , comment: '開催日'
      t.time :open , comment: 'オープン時間'
      t.time :start , comment: 'スタート時間'
      t.integer :adv , comment: '前売り料金'
      t.integer :door , comment: '当日料金'
      t.text :concept , comment: 'コンセプト(概要に組み込む)'
      t.string :house , comment: 'ライブハウス'
      t.string :images , comment: 'フライヤーやタイムテーブルを配列で格納'
      t.string :aasm_state, comment: '状態 %(完了 オファー中 構想)'
      t.integer :eventer_id, comment: '主催者id'
      t.timestamps
    end
  end
end
