class User < ApplicationRecord
  include Clearance::User

  validates :store_id, uniqueness: true, presence: true
  validates :name, presence: true
end
