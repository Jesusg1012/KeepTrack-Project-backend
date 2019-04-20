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
    @project = Project.find_by(id: id)
    if @project
      render json: {project: ProjectSerializer.new(@project)}, status: :accepted
    else
      render json: { message: 'project not found'}, status: :not_acceptable
    end
  end
  def change
    project = current_user.projects.find_by(id: project_params[:id])
    if project
      project.title = project_params[:title]
      project.save
      render json: {user: UserSerializer.new(current_user)}, status: :accepted
    else
      render json: { message: 'project not found'}, status: :not_acceptable
    end
  end
  def new
    @project = Project.create(user_id: current_user.id, title: project_params[:title])
    if @project
      render json: {project: ProjectSerializer.new(@project)}, status: :accepted
    else
      render json: { message: 'project not found'}, status: :not_acceptable
    end
  end

  private
    def project_params
      params.require(:project).permit(:id, :title)
    end

end
