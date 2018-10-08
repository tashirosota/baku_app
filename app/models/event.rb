# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  date       :date
#  open       :time
#  start      :time
#  adv        :integer
#  door       :integer
#  concept    :text
#  house      :string
#  images     :string
#  aasm_state :string
#  eventer_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  include AasmEvent
  mount_uploader :images, EventUploader # carrierwave設定の時にまとめてやる

  validates :title, presence: true
  validates :concept, length: { maximum: 240 }

  # Event.artists オファーしたバンド一覧, Event.artists.where(aasm_state: :ok) 決定バンド一覧
  has_many :offers
  has_many :artists, through: :offers

  # Event.eventer 主催者
  belongs_to :eventer

  # Event.collaborative_eventers 共同制作者一覧
  has_many :collaborators
  has_many :collaborative_eventers, through: :collaborators, source: :eventer

  def my_offer(artist)
    offers.find_by(artist: artist)
  end

  def my_offered_artists(eventer)
    artists.where(eventer: eventer)
  end

  # aasm_state_artists でofferの状態がaasm_stateのartists一覧を取得できる Event.ok_artists
  Offer.aasm.states.map(&:name).each do |state|
    define_method("#{state}_artists".to_sym) do
      offers.where(aasm_state: state).map(&:artist)
    end
  end
end
