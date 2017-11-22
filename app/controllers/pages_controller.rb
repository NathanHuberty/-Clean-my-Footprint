class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard

    #trips/new

    #trips/index
    # @trips_to_clean = Trip.where(user: current_user && compensation )
    @trips = Trip.where(user: current_user)
    #compensations/new

    #projects/index
  end
end
