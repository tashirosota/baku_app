class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :from_user_id, null: false
      t.integer :to_user_id, null: false
      t.string :aasm_state , comment: '状態 %(申請中 却下 友達 解除)'
      t.timestamps
    end
  end
end
