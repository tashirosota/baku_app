class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.get_new_records
    order(:created_at).where(created_at: Time.now.beginning_of_month..Time.now).limit(3)
  end
end
