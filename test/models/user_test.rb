# == Schema Information
#
# Table name: organizers
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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
