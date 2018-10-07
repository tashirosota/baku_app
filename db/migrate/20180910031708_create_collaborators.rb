class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.integer :eventer_id, comment: '共済者id'
      t.integer :event_id, comment: 'イベントid'
      t.string :role, comment: '権限'
      t.timestamps
    end
  end
end
