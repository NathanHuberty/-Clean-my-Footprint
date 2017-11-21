class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard

    #trips/new

    #trips/index

    #compensations/new

    #projects/index
  end
end
