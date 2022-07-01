class ProjectPolicy < ApplicationPolicy
  # class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
  #   # def resolve
  #   #   scope.all
  #   # end
  # end
  # attr_reader :user, :project

  # def initialize(user, project)
  #   @user = user
  #   @project = project
  # end
  # #  attr_reader :user, :post

  def create?
    user.manger?
  end

  def update?
    user.manger? && [user.id] == project.user_ids
  end

  def destroy?
    user.manger? && [user.id] == project.user_ids
  end

  private

  def project
    record
  end
end
