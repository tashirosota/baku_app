# == Schema Information
#
# Table name: collaborators
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collaborator < ApplicationRecord
  belongs_to :event
  belongs_to :eventer
end
