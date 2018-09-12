class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.integer :user_id, comment: '主催者id'
      t.integer :event_id, comment: 'イベントid'
      t.timestamps
    end
  end
end
