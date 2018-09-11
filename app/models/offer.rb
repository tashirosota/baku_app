# == Schema Information
#
# Table name: offers
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Offer < ApplicationRecord
  extend Enumerize
  enumerize :status, in: %w(candidate offering ng ok cancel), scope: true, default: 'candidate', predicates: true
end
