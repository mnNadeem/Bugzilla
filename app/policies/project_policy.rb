# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.manger?
  end

  def update?
    user.manger? && project.users.manger.pluck(:id) == [user.id]
  end

  def destroy?
    user.manger? && project.users.manger.pluck(:id) == [user.id]
  end

  def add_qas_developers?
    user.manger? && project.users.manger.pluck(:id) == [user.id]
  end

  def project
    record
  end
end
