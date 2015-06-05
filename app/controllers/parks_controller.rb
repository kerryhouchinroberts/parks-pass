class ParksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @parks = Park.all
    render json: @parks
  end

  def show
    @park = Park.find(params[:id])
    insta_fetcher = InstaFetcher.new
    if current_user != nil
      @photos = insta_fetcher.park_pics(@park.latitude, @park.longitude, current_user.token)
      @doi_photos = insta_fetcher.dept_of_interior_pics(current_user.token)
    end
    rec_fetcher = RecFetcher.new
    @park_rec_info = rec_fetcher.park_info(@park.rec_id)
    @park_rec_photos = rec_fetcher.park_photos(@park.rec_id)
    if @park_rec_photos["RECDATA"].count > 0
      @first_park_rec_photo = @park_rec_photos["RECDATA"][0]
      @remaining_park_rec_photos = @park_rec_photos["RECDATA"].drop(1)
    end
    @park_links = rec_fetcher.park_links(@park.rec_id)
  end

  def parkname
    @park = Park.find_by_name(params[:name])
    render json: @park
  end
end
