class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :condition , comment: '出演条件'
      t.string :aasm_state , comment: '状態%(候補 オファー中 拒否 決定 キャンセル)'
      t.integer :event_id, comment: 'イベントid'
      t.integer :artist_id, comment: 'アーティストid'

      t.timestamps
    end
  end
end
