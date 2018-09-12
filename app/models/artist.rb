# == Schema Information
#
# Table name: artists
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  web_url      :string
#  genre        :string
#  mv_urls      :string
#  artist_image :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Artist < ApplicationRecord
  extend Enumerize
  # youtubeでバリデーション
  before_validation :valid_mv_urls

  # mount_uploader :artist_image, ArtistImageUploader #carrierwave設定の時にまとめてやる
  validates :name, presence: true
  validates :web_url, format: /\A#{URI.regexp(%w(http https))}\z/
  validates :genre, presence: true

  has_many :offers
  belongs_to :user

  def valid_mv_urls
    return true unless valid_mv_urls
  end
end