# == Schema Information
#
# Table name: friends
#
#  id           :bigint(8)        not null, primary key
#  from_user_id :integer          not null
#  to_user_id   :integer          not null
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Friend < ApplicationRecord
  extend Enumerize

  enumerize :status, in: %w(request rejected approved goodbye), scope: true, predicates: true

  belongs_to :from_user, class_name: 'User', foreign_key: :from_user_id
  belongs_to :to_user, class_name: 'User', foreign_key: :to_user_id
end
