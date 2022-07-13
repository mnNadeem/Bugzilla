# frozen_string_literal: true

class BugsController < ApplicationController
  before_action :find_bug, only: %i[show edit update destroy assign_bug_to_developer resolve_bug]
  before_action :authorize_bug, only: %i[edit destroy assign_bug_to_developer resolve_bug]

  def index
    @bug = Bug.all
  end

  def new
    @bug = Bug.new
    authorize_bug
  end

  def create
    @bug = current_user.bugs.new(bug_params)
    if @bug.save
      flash[:notice] = 'Bug is created successfully'
      redirect_to :projects
    else
      flash[:alert] = @bug.errors.full_messages.first
      redirect_to :new_bug
    end
  end

  def show; end

  def edit; end

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
      flash[:elert] = @bug.errors.full_messages.first
    end
  end

  def assign_bug_to_developer
    @bug.update(dev_id: current_user.id)
    @bug.update(status: 1)
    flash[:notice] = 'Bug is Assigned successfully to you'
    redirect_to :projects
  end

  def resolve_bug
    @bug.update(status: 3)
    flash[:notice] = 'Bug is resolved successfuly'
    redirect_to :projects
  end

  private

  def find_bug
    @bug = Bug.find_by(id: params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :deadline, :screenshot, :bug_type, :status, :project_id)
  end

  def authorize_bug
    authorize @bug
  end
end
