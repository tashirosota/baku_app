# == Schema Information
#
# Table name: state_histories
#
#  id             :bigint(8)        not null, primary key
#  state          :string
#  previous_state :string
#  stateable_id   :integer
#  stateable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class StateHistory < ApplicationRecord
  belongs_to :stateable, polymorphic: true
  scope :order_asc, -> { order(created_at: :asc) }
end
