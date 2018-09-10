class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.string :status , comment: '状態 %(申請中 却下 友達)'
      t.timestamps
    end
  end
end
