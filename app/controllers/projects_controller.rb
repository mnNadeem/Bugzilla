#  frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :find_project,
                only: %i[show edit update destroy remove_qas remove_developers]
  before_action :authorize_project, only: %i[edit destroy]
  before_action :qas_developers,
                only: %i[edit update]

  def index
    @project = if current_user.manger?
                 Project.all.page(params[:page])
               else
                 current_user.projects.all.page(params[:page])
               end
  end

  def new
    @project = Project.new
    authorize_project
  end

  def create
    @project = Project.new(project_params)
    current_user.projects << @project
    if @project.save
      qas_developers_projects(@project)
      flash[:notice] = 'Project is created successfully'
    else
      flash[:alert] = @project.errors.full_messages.first
    end
    redirect_to :projects
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      qas_developers_projects(@project)
      flash[:notice] = 'Project is updated successfully'
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    if @project.delete
      flash[:notice] = 'Project deleted successfully!'
      redirect_to :projects
    else
      flash[:alert] = @project.errors.full_messages.first
    end
  end

  def remove_qas
    user = User.find_by(id: params[:qa_id])
    @project.users.delete(user)
    flash_message
  end

  def remove_developers
    user = User.find_by(id: params[:dev_id])
    @project.users.delete(user)
    flash_message
  end

  private

  def qas_developers_projects(project)
    project.developer.each do |developer|
      project.users << User.find_by(id: developer) if developer.present?
    end
    project.qa.each do |qa|
      project.users << User.find_by(id: qa) if qa.present?
    end
  end

  def qas_developers
    @qas = @project.users.qa
    @developers = @project.users.developer
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, qa: [], developer: [])
  end

  def authorize_project
    authorize @project
  end

  def flash_message
    redirect_to controller: 'projects', action: 'edit'
  end
end
