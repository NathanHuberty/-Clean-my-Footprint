class CompensationsController < ApplicationController
  def show
    @compensation = Compensation.where(state: 'paid').find(params[:id])
  end

  def create
    # works if one compensation has 1 or more trips and one project
    @compensation = Compensation.new(compensation_params)
    total_emission = 0
    @compensation.trips.each do |trip|
      total_emission += (trip.km * trip.transportation.emission)
    end
    @compensation.amount_cents = (total_emission / @compensation.project.carbon * 100) + 100
    @compensation.state = "pending"
    if @compensation.save
      redirect_to new_compensation_payment_path(@compensation)
    else
      render 'pages/dashboard'
    end

  end

  private

  def compensation_params
    params.require(:compensation).permit(:project_id, :trip_ids)
  end
end
