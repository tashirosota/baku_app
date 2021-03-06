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

  # Artist.events 誘われているライブ
  has_many :offers
  has_many :events, through: :offers

  # Artist.eventer このアーティストを登録したイベンター
  belongs_to :eventer

  def valid_mv_urls
    return true unless mv_urls
  end

  def ok_count
    offers.where(aasm_state: :ok)
  end

  def my_offer(event)
    offers.find_by(event: event)
  end

  # aasm_state_artists でofferの状態がaasm_stateのartists一覧を取得できる Event.ok_artists
  Offer.aasm.states.map(&:name).each do |state|
    define_method("#{state}_events".to_sym) do
      offers.where(aasm_state: state).map{|o| o.event}
    end
  end

  def nearest_event
    ok_events&.select{|e| e.date >= Date.today}.sort_by{|e| e.date}.first
    # ok_events => 決定してあるイベント一覧を配列で取得
    # selectでその中の今日以降のものに絞る
    # sort_byでその中を開催日順にsort
    # 一番近い日程をfirstで返す
  end
end
