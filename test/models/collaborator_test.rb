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

require 'test_helper'

class CollaboratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
