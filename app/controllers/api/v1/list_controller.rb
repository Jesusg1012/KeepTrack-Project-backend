class Api::V1::ListController < ApplicationController
  def new
    @project = current_user.projects.find_by(id: list_params[:project])
    if(@project && list_params[:title].length > 0)
      List.create(project_id: list_params[:project], title: list_params[:title].split.join(" "))
      render json: {project: ProjectSerializer.new(@project)}, status: :accepted
    else
      render json: { message: 'project not found'}, status: :not_acceptable
    end
  end
  def view
    id = request.headers['List']
    project = request.headers['Project']
    @project = current_user.projects.find_by(id: project)
    @list = @project.lists.find_by(id: id)
    render json: {list: ListSerializer.new(@list,{include: [:name_infos]})}, status: :accepted
  end
  def row
    project = Project.find_by(id: list_params[:project])
    @list = project.lists.find_by(id: list_params[:id])
    if @list
      @list.newRow()
      render json: {list: ListSerializer.new(@list,{include: [:name_infos]})}, status: :accepted
    else
      render json: { message: 'list not found'}, status: :not_acceptable
    end
  end
  def column
    project = Project.find_by(id: list_params[:project])
    @list = project.lists.find_by(id: list_params[:id])
    if @list
      @list.newColumn()
      render json: {list: ListSerializer.new(@list,{include: [:name_infos]})}, status: :accepted
    else
      render json: { message: 'list not found'}, status: :not_acceptable
    end
  end
  def delete_row
    project = Project.find_by(id: list_params[:project])
    @list = project.lists.find_by(id: list_params[:id])
    if @list
      @list.names.delete(list_params[:row])
      render json: {list: ListSerializer.new(@list,{include: [:name_infos]})}, status: :accepted
    else
      render json: { message: 'list not found'}, status: :not_acceptable
    end
  end
  def delete_column
    project = Project.find_by(id: list_params[:project])
    @list = project.lists.find_by(id: list_params[:id])
    if @list
      @list.infos.delete(list_params[:column])
      render json: {list: ListSerializer.new(@list,{include: [:name_infos]})}, status: :accepted
    else
      render json: { message: 'list not found'}, status: :not_acceptable
    end
  end
  def info
    project = Project.find_by(id: list_params[:project])
    @list = project.lists.find_by(id: list_params[:id])
    if @list
      if list_params[:type] == "name"
        row = @list.names.find_by(id: list_params[:type_id])
        row.name = list_params[:text]
        row.save
      elsif list_params[:type] == "column"
        column = @list.infos.find_by(id: list_params[:type_id])
        column.name = list_params[:text]
        column.save
      else
        info = @list.name_infos.find_by(id: list_params[:type_id])
        info.content = list_params[:text]
        info.save
      end
      render json: {list: ListSerializer.new(@list,{include: [:name_infos]})}, status: :accepted
    else
      render json: { message: 'list not found'}, status: :not_acceptable
    end
  end
  def destroy
    @project = Project.find_by(id: list_params[:project])
    @list = @project.lists.find_by(id: list_params[:id])
    if @list
      @list.destroy
      render json: {project: ProjectSerializer.new(@project)}, status: :accepted
    else
      render json: { message: 'list not found'}, status: :not_acceptable
    end
  end
  private
  def list_params
    params.require(:list).permit(:title, :project, :id, :row, :column, :type, :text, :type_id)
  end
end
