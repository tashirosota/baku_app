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

require 'test_helper'

class FriendTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end