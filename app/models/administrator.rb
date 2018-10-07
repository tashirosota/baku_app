# == Schema Information
#
# Table name: administrators
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  password_digest :string           not null
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Administrator < ApplicationRecord
  extend Enumerize
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }
  enumerize :role, in: %w(root admin operator), scope: true, default: 'operator', predicates: true

  # 権限毎に操作を変える時に使う
  LEVEL = {
    'root' => 3,
    'admin' => 2,
    'operator' => 1
  }.freeze
end
