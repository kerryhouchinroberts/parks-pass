class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  has_many :parks, through: :trips
end
