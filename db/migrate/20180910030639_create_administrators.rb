class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :name, comment: '管理者名'
      t.string :password_digest, null: false, comment: '暗号化パスワード'
      t.string :role, comment: '権限% (root admin)'
      t.timestamps
    end
  end
end
