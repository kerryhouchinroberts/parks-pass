class User < ActiveRecord::Base
  has_many :trips
  has_many :parks, through: :trips
end
