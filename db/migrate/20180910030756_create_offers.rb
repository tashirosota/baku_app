class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :condition , comment: '出演条件'
      t.string :status , comment: '状態%(拒否 決定 オファー中)'

      t.timestamps
    end
  end
end
