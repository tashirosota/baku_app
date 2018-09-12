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

FactoryBot.define do
  factory :friend do
  end
end
