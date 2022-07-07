# frozen_string_literal: true

module BugsHelper
  def bug_types
    Bug.bug_types
  end

  def bug_status
    Bug.statuses
  end

  def user_projects_ids
    current_user.projects.ids
  end
end
