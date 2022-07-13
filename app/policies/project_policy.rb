# frozen_string_literal: true

class ProjectPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.manger?
  end

  def update?
    user.manger? && user_ids
  end

  def destroy?
    user.manger? && user_ids
  end

  def add_qas_developers?
    user.manger? && user_ids
  end

  def project
    record
  end

  def user_ids
    project.users.manger.pluck(:id) == [user.id]
  end
end
