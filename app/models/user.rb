class User < ApplicationRecord
  include Clearance::User

  validates :store_id, unique: true, required: true
  validates :name, required: true
end
