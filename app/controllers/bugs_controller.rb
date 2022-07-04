class BugsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]
  # before_action :authorize_project, only: [:edit, :destroy,:add_qas_developers]

  def index
    @bug=Bug.all
  end

  def new
    @bug=Bug.new
  end
  def create
    @bug=Bug.new(bug_params)
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

  # def add_qas_developers
  #   @qas = @project.users.qa
  #   @developers = @project.users.developer
  # end

  # def remove_qas_developers
  #   user = User.find(params[:qa_id])
  #   @project.users.delete(user)
  #   @qas = @project.users.qa
  #   render 'add_qas_developers'
  # end

  private

  def find_bug
    @bug=Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :deadline)
  end

  # def authorize_project
  #   authorize @project
  # end

end
