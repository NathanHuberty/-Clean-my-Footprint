require_relative '../services/google_api'

class TripsController < ApplicationController

  def create


    if params[:trip][:recurrent] == "true"
      starting_date = Date.parse("#{params[:trip]['date_since(1i)']}/#{params[:trip]['date_since(2i)']}/#{params[:trip]['date_since(3i)']}")
      days_between = (Date.today - starting_date).to_i
      frequency = params[:trip][:number_per].to_i

      if params[:trip][:time_unit] == "jour"
        single_trips = days_between * frequency
      elsif params[:trip][:time_unit] == "semaine"
        single_trips = (days_between / 7).floor * frequency
      else # if mois
        single_trips = (days_between / 30).floor * frequency
      end
    else
      single_trips = params[:trip][:number_of_times].to_i
    end

    @trip = Trip.new(trip_params)
    @trip.user = current_user
    case @trip.transportation.category
    when "Voiture" || "Avion" || "Moto"
      transport = "driving"
    when "Train" || "Transport en commun"
      transport = "transit"
    end

    @trip.number = single_trips * params[:trip][:num_return].to_i
    @trip.km = GoogleApi.km_calcul("#{@trip.start_address}", "#{@trip.destination_address}", "#{transport}") * @trip.number

    if @trip.save!
      redirect_to dashboard_path
    else
      render params[:url]
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:start_address, :destination_address, :number, :transportation_id)
  end
end
