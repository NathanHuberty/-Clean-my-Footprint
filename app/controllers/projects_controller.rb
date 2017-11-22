class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def show

  end


  private

  def project_params
    params.require(:project).permit(:name, :description, :carbon, photos: [])
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
