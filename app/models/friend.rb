# == Schema Information
#
# Table name: friends
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friend < ApplicationRecord
  extend Enumerize
  enumerize :status, in: %w(request rejected approved goodbye), scope: true, predicates: true
end
