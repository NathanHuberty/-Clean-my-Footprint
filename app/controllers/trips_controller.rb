require_relative '../services/google_api'

class TripsController < ApplicationController

  def create
    if params[:trip][:recurring] == "1"
      starting_date = Date.parse("#{params[:trip]['date_since(1i)']}/#{params[:trip]['date_since(2i)']}/#{params[:trip]['date_since(3i)']}")
      frequency = params[:trip][:number_per].to_i
      time_unit = params[:trip][:time_unit]
      days_between = (Date.today - starting_date).to_i
      time_units = {"jour" => 1,"semaine" => 7, "mois" => 30 }
      single_trips = (days_between / time_units[time_unit]).floor * frequency
    else
      single_trips = params[:trip][:number_of_times].to_i
    end
    @trip = current_user.trips.new(trip_params)
    @trip.number = single_trips * params[:trip][:num_return].to_i

    @trip.save
    distance_for_one_trip = GoogleApi.km_calcul(@trip)

    if distance_for_one_trip.present?
      @trip.update(km: distance_for_one_trip)
      redirect_to dashboard_path
    else
      @trip.destroy
      @compensation = Compensation.new
      @trips = current_user.trips
      @projects = Project.all
      render "pages/dashboard"
      flash[:alert] = "Not a valid route"
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to "/dashboard"
  end

  private

  def trip_params
    params.require(:trip).permit(:start_address, :destination_address, :number, :transportation_id)
  end
end
