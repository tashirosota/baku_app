# == Schema Information
#
# Table name: users
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  avatar       :string
#  twitter_url  :string
#  facebook_url :string
#  profile      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :user do
  end
end
