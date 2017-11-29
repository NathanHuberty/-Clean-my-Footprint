require_relative '../services/google_api'

class TripsController < ApplicationController

  def create
    # On a besoin de ces 3 variables pour rendre pages/dashboard en cas d erreur
    # Voir si on peut simplifier l action Pages#Dashboard


    #TODO: Refacto dans un service ?
    if params[:trip][:recurring] == "1"
      starting_date = Date.parse(params["date_since"])
      frequency = params[:trip][:number_per].to_i
      time_unit = params[:trip][:time_unit]
      days_between = (Date.today - starting_date).to_i
      time_units = {"jour" => 1,"semaine" => 7, "mois" => 30 }
      single_trips = (days_between / time_units[time_unit]).floor * frequency
    else
      single_trips = params[:trip][:number_of_times].to_i
    end

    @trip = current_user.trips.new(trip_params)
    @trip.transportation = Transportation.find(params[:transportation])

    # ATTENTION single_trips ne doit jamais etre nil
    @trip.number = single_trips * (params[:trip][:num_return].last.to_i + 1)
    @trip.km = GoogleApi.km_calcul(@trip) if @trip.geocode
    if @trip.save
      redirect_to dashboard_path
    else
      @compensation = Compensation.new
      @projects = Project.all
      flash[:alert] = "Not a valid route"
      render "pages/dashboard"
    end

  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to "/dashboard"
  end

  private

  def trip_params
    params.require(:trip).permit(:start_address, :destination_address, :number)
  end
end
