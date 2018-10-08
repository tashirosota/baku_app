class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.new_records
    order(:created_at).where(created_at: Time.zone.now.beginning_of_month..Time.zone.now).limit(3)
  end
end
