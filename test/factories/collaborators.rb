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

FactoryBot.define do
  factory :collaborator do
  end
end