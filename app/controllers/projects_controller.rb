class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authorize_project, only: [:edit, :destroy]
  before_action :find_project1, only: [:create]

  def index
    @project=Project.all
  end

  def new
    @project=Project.new
    authorize @project
  end

  def create
    current_user.projects << @project
    if @project.save
      flash[:notice] = 'Project is created successfully'
        redirect_to :projects
    else
      flash[:notice] = 'Project not created'
      redirect_to :projects
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
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
      flash[:error] = 'Failed to delete this project!'
    end
  end

  private

  def find_project
    @project=Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def authorize_project
    authorize @project
  end

  def find_project1
    @project=Project.new(project_params)
  end

end

