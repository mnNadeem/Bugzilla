class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy, :add_qas_developers, :remove_qas_developers]
  before_action :authorize_project, only: [:edit, :destroy,:add_qas_developers]

  def index
    if current_user.manger?
      @project=Project.all
    else
      @project=current_user.projects
    end
  end

  def new
    @project=Project.new
    authorize @project
  end

  def create
    @project=Project.new(project_params)
    current_user.projects << @project
    if @project.save
      @project.developer.each do |developer|
        @project.users << User.find(developer) if developer.present?
      end
      @project.qa.each do |qa|
        @project.users << User.find(qa) if qa.present?
      end
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
      @project.developer.each do |developer|
        @project.users << User.find(developer) if developer.present?
      end
      @project.qa.each do |qa|
        @project.users << User.find(qa) if qa.present?
      end
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

  def add_qas_developers
    @qas = @project.users.qa
    @developers = @project.users.developer
  end

  def remove_qas_developers
    user = User.find(params[:qa_id])
    @project.users.delete(user)
    @qas = @project.users.qa
    render 'add_qas_developers'
  end

  private

  def find_project
    @project=Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, qa: [], developer: [])
  end

  def authorize_project
    authorize @project
  end
end
