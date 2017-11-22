class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard

    #trips/new
    @trip = Trip.new
    #trips/index

    #compensations/new

    #projects/index
  end
end
