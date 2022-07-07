# frozen_string_literal: true

class BugPolicy < ApplicationPolicy
  def create?
    user.qa?
  end

  def destroy?
    user.qa?
  end

  def resolve_bug?
    user.developer?
  end

  def assign_bug_to_developer?
    user.developer?
  end
end
