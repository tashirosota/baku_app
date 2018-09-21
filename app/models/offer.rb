# == Schema Information
#
# Table name: offers
#
#  id         :bigint(8)        not null, primary key
#  condition  :string
#  status     :string
#  event_id   :integer
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Offer < ApplicationRecord
  extend Enumerize
  belongs_to :event
  belongs_to :artist
  enumerize :status, in: %w(candidate offering ng ok cancel), scope: true, default: 'candidate', predicates: true
end
