class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :create_trip
  def home
  end

  def dashboard
    @transports = [ {
              icon: "bus",
              name: Transportation.find_by(category: "Transport en commun").id
                }, {
              icon: "train",
              name: Transportation.find_by(category: "Train").id
                }, {
              icon: "motorcycle",
              name: Transportation.find_by(category: "Moto").id
                }, {
              icon: "car",
              name: Transportation.find_by(category: "Voiture").id
                }, {
              icon: "plane",
              name: Transportation.find_by(category: "Avion").id
                } ]
    #trips/create
    #trips/index
    # @trips_to_clean = Trip.where(user: current_user && compensation )
    @compensation = Compensation.new
    @trips = current_user.trips
    @projects = Project.all
    #compensations/new
    #projects/index
  end

  private

  def create_trip
    @trip = Trip.new
  end


end
