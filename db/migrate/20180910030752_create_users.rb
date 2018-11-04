class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :organizers do |t|
      t.string :name, comment: 'ユーザ名'
      t.string :avatar, comment: 'プロフィール写真'
      t.string :twitter_url, comment: 'twitter_url'
      t.text :profile, comment: '紹介文'
      t.string :name, comment: '管理者名'
      t.string :password_digest, null: false, comment: '暗号化パスワード'
      t.timestamps
    end
  end
end
