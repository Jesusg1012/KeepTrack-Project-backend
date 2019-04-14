class Api::V1::ProjectController < ApplicationController
  def create
    @project = Project.create(title: project_params[:title], user_id: current_user.id)
      render json: { project: ProjectSerializer.new(@project) }, status: :accepted
  end
  def index
    @projects = current_user.projects
    if @projects
      render json: { projects: @projects }
    else
      render json: { message: 'projects not found'}, status: :not_acceptable
    end
  end
  def view
    id = request.headers['Project']
    @project = current_user.projects.find_by(id: id)
    if @project
      render json: {project: ProjectSerializer.new(@project)}, status: :accepted
    else
      render json: { message: 'project not found'}, status: :not_acceptable
    end
  end
  def list
    @project = current_user.projects.find_by(id: list_params[:project])
    if(@project && list_params[:title].length > 0)
      List.create(project_id: list_params[:project], title: list_params[:title])
      render json: {project: ProjectSerializer.new(@project)}, status: :accepted
    else
      render json: { message: 'project not found'}, status: :not_acceptable
    end
  end
  private
    def project_params
      params.require(:project).permit(:id)
    end
    def list_params
      params.require(:list).permit(:title, :project)
    end
end
