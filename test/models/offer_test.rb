# == Schema Information
#
# Table name: offers
#
#  id         :bigint(8)        not null, primary key
#  condition  :string
#  aasm_state :string
#  event_id   :integer
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OfferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
