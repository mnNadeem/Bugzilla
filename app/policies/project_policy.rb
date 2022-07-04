class ProjectPolicy < ApplicationPolicy

  def index?
    true
  end
  def create?
    user.manger?
  end

  def update?
    user.manger? && [user.id] == project.users.manger.pluck(:id)
  end

  def destroy?
    user.manger? && [user.id] == project.users.manger.pluck(:id)
  end

  def add_qas_developers?
    user.manger? && [user.id] == project.users.manger.pluck(:id)
  end

  def project
    record
  end
  
end
