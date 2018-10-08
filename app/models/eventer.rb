# == Schema Information
#
# Table name: eventers
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  avatar      :string
#  twitter_url :string
#  profile     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Eventer < ApplicationRecord
  # snsのカラムをvalidationしようと思ってるけど、そもそも更新を紐づけたときだけにしたら必要ないお
  before_validation :valid_twitter_url
  mount_uploader :avatar, EventerUploader #carrierwave設定の時にまとめてやる
  validates :name, presence: true, uniqueness: true
  validates :profile, presence: true, length: { maximum: 240 }

  #Eventer.eventsで主催イベント一覧
  has_many :events
  #Eventer.eventsで登録バンド一覧
  has_many :artists
  #Eventer.collaborative_eventsで共同制作者としてのイベント一覧
  has_many :collaborators
  has_many :collaborative_events, through: :collaborators ,source: :event

  def valid_twitter_url
    return true unless twitter_url
  end
end
