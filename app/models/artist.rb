class Artist < ApplicationRecord
  extend Enumerize
  # youtubeでバリデーション
  before_validation :valid_mv_urls

  # mount_uploader :artist_image, ArtistImageUploader #carrierwave設定の時にまとめてやる
  validates :name, presence: true
  validates :web_url, format: /\A#{URI.regexp(%w(http https))}\z/
  validates :genre, presence: true

  def valid_mv_urls
    return true unless valid_mv_urls
  end
end
