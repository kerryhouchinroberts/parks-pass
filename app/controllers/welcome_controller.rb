class WelcomeController < ApplicationController
  def index
    @park1 = Park.find(rand(1..7))
    @park2 = Park.find(rand(8..15))
    @park3 = Park.find(rand(16..23))
    @park4 = Park.find(rand(24..31))
    @park5 = Park.find(rand(32..39))
    @park6 = Park.find(rand(40..47))
    @park7 = Park.find(rand(48..53))
    @park8 = Park.find(rand(54..59))
  end
end
