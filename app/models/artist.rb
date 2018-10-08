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
#  eventer_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Artist < ApplicationRecord
  extend Enumerize
  # youtubeでバリデーション
  before_validation :valid_mv_urls

  mount_uploader :artist_image, ArtistUploader

  validates :name, presence: true
  validates :web_url, format: { with: /\A#{URI.regexp(%w(http https))}\z/ }, allow_blank: true
  validates :genre, presence: true

  #Artist.events 誘われているライブ
  has_many :offers
  has_many :events, through: :offers

  #Artist.eventer このアーティストを登録したイベンター
  belongs_to :eventer

  def valid_mv_urls
    return true unless mv_urls
  end

  def ok_count
    offers.where(aasm_state: :ok)
  end
end
