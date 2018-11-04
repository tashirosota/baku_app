# == Schema Information
#
# Table name: eventers
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  avatar          :string
#  twitter_url     :string
#  profile         :text
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Eventer < ApplicationRecord
  # snsのカラムをvalidationしようと思ってるけど、そもそも更新を紐づけたときだけにしたら必要ないお
  before_validation :valid_twitter_url
  mount_uploader :avatar, EventerUploader # carrierwave設定の時にまとめてやる
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :profile, presence: true, length: { maximum: 240 }

  # Eventer.eventsで主催イベント一覧
  has_many :events
  # Eventer.eventsで登録バンド一覧
  has_many :artists
  # Eventer.collaborative_eventsで共同制作者としてのイベント一覧
  has_many :collaborators
  has_many :collaborative_events, through: :collaborators, source: :event

  def valid_twitter_url
    return true unless twitter_url
  end

  Event.aasm.states.map(&:name).each do |state|
    define_method("#{state}_events_count".to_sym) do
      events.where(aasm_state: state).count
    end
  end

  Event.aasm.states.map(&:name).each do |state|
    define_method("#{state}_collaborative_events_count".to_sym) do
      collaborative_events.where(aasm_state: state).count
    end
  end

  def my_collaboration(event)
    collaborators.find_by(event: event)
  end
end
