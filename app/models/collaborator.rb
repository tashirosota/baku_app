# == Schema Information
#
# Table name: collaborators
#
#  id         :bigint(8)        not null, primary key
#  eventer_id :integer
#  event_id   :integer
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Collaborator < ApplicationRecord
  extend Enumerize

  belongs_to :event
  belongs_to :eventer

  enumerize :role, in: %w(editor viewer), scope: true, default: 'viewer', predicates: true
end
