class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, comment: 'アーティスト名'
      t.string :web_url, comment: 'サイトurl'
      t.string :genre, commment: 'ジャンル'
      t.string :mv_urls, comment: 'mv(配列で格納)'
      t.string :artist_image, comment: 'アー写'

      t.timestamps
    end
  end
end
