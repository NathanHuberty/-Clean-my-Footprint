class TripsController < ApplicationController

  def create
    # Transportation.select { |t|
    #   t == trip_params[:transportation]
    # }
    @trip = Trip.new(trip_params)
    # helper km
    # if @trip.save!
    #   redirect_to dashboard_path
    # else
    #   render :new
    # end
  end

  def trip_params
    params.require(:trip).permit(:start_address, :destination_address, :number, :transportation)
  end
end
