class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :organizers do |t|
      t.string :name, comment: 'ユーザ名'
      t.string :avatar, comment: 'プロフィール写真'
      t.string :twitter_url, comment: 'twitter_url'
      t.text :profile, comment: '紹介文'

      t.timestamps
    end
  end
end
