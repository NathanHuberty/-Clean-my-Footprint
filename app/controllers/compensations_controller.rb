class CompensationsController < ApplicationController
  def create
    @compensation = Compensation.new(compensation_params)
    if @compensation.save
      redirect_to dashboard_path
    else
      render 'pages/dashboard'
    end
  end

  private

  def compensation_params
    params.require(:compensation).permit(:project_id, :trip_ids)
  end
end
