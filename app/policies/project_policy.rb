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
    return true if user.manger? && user == project.user
  end

  def destroy?
    return true if user.manger? && user == project.user
  end

  private

  def project
    record
  end
end
