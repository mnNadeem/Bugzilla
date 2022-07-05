class BugPolicy < ApplicationPolicy
  def create?
    user.qa?
  end
end
