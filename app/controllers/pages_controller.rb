class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :create_trip
  def home
  end

  def dashboard

    #trips/create
    #trips/index
    # @trips_to_clean = Trip.where(user: current_user && compensation )
    @trips = Trip.where(user: current_user)
    #compensations/new

    #projects/index
  end

  private

  def create_trip
    @trip = Trip.new
  end
end
