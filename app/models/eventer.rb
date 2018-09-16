# == Schema Information
#
# Table name: eventers
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

class Eventer < ApplicationRecord
  # snsのカラムをvalidationしようと思ってるけど、そもそも更新を紐づけたときだけにしたら必要ないお
  before_validation :valid_facebook_url, :valid_twitter_url
  # mount_uploader :avatar, AvatarUploader #carrierwave設定の時にまとめてやる
  validates :name, presence: true, uniqueness: true
  validates :profile, presence: true, length: { maximum: 240 }

  has_many :events
  has_many :artists
  has_many :collaborators
  has_many :follows_from, class_name: 'Friend', foreign_key: :from_user_id
  has_many :follows_to,   class_name: 'Friend', foreign_key: :to_user_id
  has_many :following, through: :follows_from, source: :to_user
  has_many :followed,  through: :follows_to,   source: :from_user

  def valid_twitter_url
    return true unless twitter_url
  end
end
