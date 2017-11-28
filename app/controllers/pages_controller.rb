class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :create_trip
  def home
  end

  def dashboard
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
