require_relative '../services/google_api'

class TripsController < ApplicationController

  def create
    raise
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    case @trip.transportation.category
    when "Voiture" || "Avion" || "Moto"
      transport = "driving"
    when "Train" || "Transport en commun"
      transport = "transit"
    end
    @trip.km = GoogleApi.km_calcul("#{@trip.start_address}", "#{@trip.destination_address}", "#{transport}")
    if @trip.save!
      redirect_to dashboard_path
    else
      render params[:url]
    end
  end

  def trip_params
    params.require(:trip).permit(:start_address, :destination_address, :number, :transportation_id)
  end
end
