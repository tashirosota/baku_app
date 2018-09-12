# == Schema Information
#
# Table name: events
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  date       :date
#  open       :time
#  start      :time
#  adv        :integer
#  door       :integer
#  concept    :text
#  images     :string
#  status     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :event do
  end
end
