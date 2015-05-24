class ParksController < ApplicationController

  def index

  end

  def show
    @park = Park.find(params[:id])
    insta_fetcher = InstaFetcher.new
    @photos = insta_fetcher.park_pics(@park.latitude, @park.longitude, current_user.token)
  end
end
