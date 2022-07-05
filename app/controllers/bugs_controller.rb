class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :edit, :update, :destroy]
  # after_action :find_project, only: [:create]
  # before_action :authorize_project, only: [:edit, :destroy,:add_qas_developers]

  def index
    @bug=Bug.all
  end

  def new
    @bug=Bug.new
  
  def create
    @bug=current_user.bugs.new(bug_params)
    if @bug.save
      flash[:notice] = 'Bug is created successfully'
        redirect_to :bugs
    else
      flash[:notice] = 'Bug is not created'
      redirect_to :bugs
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bug.update(bug_params)
      flash[:notice] = 'Project is updated successfully'
      redirect_to @bug
    else
      render 'edit'
    end
  end

  def destroy
    @bug.destroy
    if @bug.delete
      flash[:notice] = 'Project deleted successfully!'
      redirect_to :bugs
    else
      flash[:error] = 'Failed to delete this project!'
    end
  end

  private

  def find_bug
    @bug=Bug.find(params[:id])
  end

  # def find_project
  #   @project=Project.includes(:users).where(current_user.projects.user_id == current_user.id)
  #   @bug.update(project_id==@project.id)
  # end

  def bug_params
    params.require(:bug).permit(:title, :deadline, :bug_type, :status, :screenshot)
  end

  # def authorize_project
  #   authorize @project
  # end

end
