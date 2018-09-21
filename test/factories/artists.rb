# == Schema Information
#
# Table name: artists
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  web_url      :string
#  genre        :string
#  mv_urls      :string
#  artist_image :string
#  eventer_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :band do
  end
end
