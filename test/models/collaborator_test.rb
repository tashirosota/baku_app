# == Schema Information
#
# Table name: collaborators
#
#  id         :bigint(8)        not null, primary key
#  eventer_id :integer
#  event_id   :integer
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CollaboratorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
