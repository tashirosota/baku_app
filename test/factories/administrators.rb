# == Schema Information
#
# Table name: administrators
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  password_digest :string           not null
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :administrator do
  end
end
