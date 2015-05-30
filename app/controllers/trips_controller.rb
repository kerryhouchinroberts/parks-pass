class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
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
  end

  def update
  end

  def destroy
  end

  private
  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :notes, :park_photos, :park_id, :user_id)
  end

end
