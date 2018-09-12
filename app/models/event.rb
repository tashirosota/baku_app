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
#  images     :string
#  status     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  extend Enumerize
  # mount_uploader :images, EventImageUploader #carrierwave設定の時にまとめてやる

  validates :title, presence: true
  validates :concept, length: { maximum: 240 }

  enumerize :status, in: %w(plan before_offered offering fixed), scope: true, default: 'plan', predicates: true

  has_many :offers
  belongs_to :user
  has_many :collaborators
end
