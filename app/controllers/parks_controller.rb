class ParksController < ApplicationController
  require 'wikipedia'

  def index
    @parks = Park.all
    render json: @parks
  end

  def show
    @park = Park.find(params[:id])
    insta_fetcher = InstaFetcher.new
    @photos = insta_fetcher.park_pics(@park.latitude, @park.longitude, current_user.token)
    @doi_photos = insta_fetcher.dept_of_interior_pics(current_user.token)
    @wikipage = Wikipedia.find("#{@park.name} National Park")
    @wiki = WikiCloth::Parser.new({
      :data => @wikipage.raw_data["query"]["pages"][@wikipage.raw_data["query"]["pages"].keys[0]]["revisions"][0]["*"] })
    rec_fetcher = RecFetcher.new
    @park_rec_info = rec_fetcher.park_info(@park.rec_id)
  end
end
