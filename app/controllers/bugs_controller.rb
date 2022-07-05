class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :edit, :update, :destroy]
  def index
    @bug=Bug.all
  end
  def new
    @bug=Bug.new
    authorize @bug
  end
  def create
    @bug=current_user.bugs.new(bug_params)
    if @bug.save!
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

  def assign_bug_to_developer
  end

  private

  def find_bug
    @bug=Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :deadline, :screenshot, :bug_type, :status, :project_id)
  end

end
