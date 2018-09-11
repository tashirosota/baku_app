# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  extend Enumerize
  # mount_uploader :images, EventImageUploader #carrierwave設定の時にまとめてやる

  validates :title, presence: true
  validates :concept, length: { maximum: 240 }

  enumerize :status, in: %w(fixed offering before_offered plan), scope: true, default: 'plan', predicates: true
end
