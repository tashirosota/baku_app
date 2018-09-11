# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  # snsのカラムをvalidationしようと思ってるけど、そもそも更新を紐づけたときだけにしたら必要ないお
  before_validation :valid_facebook_url, :valid_twitter_url
  # mount_uploader :avatar, AvatarUploader #carrierwave設定の時にまとめてやる
  validates :name, presence: true, uniqueness: true
  validates :twitter_url, presence: true
  validates :facebook_url, presence: true
  validates :profile, presence: true, length: { maximum: 240 }

  def valid_facebook_url
    return true unless facebook_url
  end

  def valid_twitter_url
    return true unless twitter_url
  end
end
