class CompensationsController < ApplicationController

  def create
    @trip = Trip.find(params[:trip_id])
    @compensation = Compensation.new(compensation_params)
    @trip.compensation = @compensation
    if @compensation.save
      redirect_to trip_path(@trip)
    else
      render 'pages/dashboard'
    end
  end

  private

  def compensation_params
    params.require(:compensation).permit(:project)
  end
end
