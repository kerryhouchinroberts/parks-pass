class TripsController < ApplicationController
  def index
    @trips = Trip.where(user_id: current_user.id)
  end

  def show
    @trip = Trip.find(params[:id])
    @park = Park.find(params[:park_id])
    rec_fetcher = RecFetcher.new
    @park_links = rec_fetcher.park_links(@park.rec_id)
    weather_fetcher = WeatherFetcher.new
    @weather = weather_fetcher.park_weather(@park.latitude,@park.longitude)
  end

  def new
    @trip = Trip.new
    @park = Park.find(params[:park_id])
  end

  def create
    @trip = Trip.new(trip_params)
    @park = Park.find(params[:park_id])
    @trip.user_id = current_user.id
    @trip.park_id = @park.id
    if @trip.save
      redirect_to park_trip_path(@park, @trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    @park = Park.find(params[:park_id])
  end

  def update
    @trip = Trip.find(params[:id])
    @park = Park.find(params[:park_id])
    if @trip.update(trip_params)
      redirect_to park_trip_path(@park, @trip)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :notes, :park_id, :user_id, park_photos: [])
  end

end
