class ParksController < ApplicationController

  def index

  end

  def show
    @park = Park.find(params[:id])
    insta_fetcher = InstaFetcher.new
    @photos = insta_fetcher.park_pics(@park.latitude, @park.longitude, current_user.token)
    @doi_photos = insta_fetcher.dept_of_interior_pics(current_user.token)
  end
end
