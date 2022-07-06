class BugsController < ApplicationController
  before_action :find_bug, only: [:show, :edit, :update, :destroy,:assign_bug_to_developer,:resolve_bug]
  before_action :authorize_bug, only: [:destroy,:assign_bug_to_developer,:resolve_bug]

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
      flash[:notice] = 'Bug deleted successfully!'
      redirect_to :bugs
    else
      flash[:error] = 'Failed to delete this Bug!'
    end
  end

  def assign_bug_to_developer
    if @bug.user_id == current_user.id
      flash[:notice] = 'This Bug is already assigned'
      redirect_to :projects
    else
      @bug.update(user_id: current_user.id)
      flash[:notice] = 'Bug is Assigned successfully to you'
      redirect_to :projects
    end
  end

  def resolve_bug
    if @bug.user_id == current_user.id
      @bug.update(status: 3)
      flash[:notice] = 'Bug is resolved successfuly'
      redirect_to :projects
    else
      flash[:notice] = 'You need to assign it first'
      redirect_to :projects
    end
  end

  private

  def find_bug
    @bug=Bug.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :deadline, :screenshot, :bug_type, :status, :project_id)
  end

   def authorize_bug
    authorize @bug
  end
end
