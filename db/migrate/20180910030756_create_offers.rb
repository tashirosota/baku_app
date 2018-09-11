class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :condition , comment: '出演条件'
      t.string :status , comment: '状態%(候補 オファー中 拒否 決定 キャンセル)'

      t.timestamps
    end
  end
end
