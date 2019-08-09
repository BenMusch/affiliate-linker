class User < ApplicationRecord
  include Clearance::User

  attr_accessor :store_id
end
