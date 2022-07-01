class Bug < ApplicationRecord
  validates_presence_of :title, :status, :type
  enum type: [:bug_t, :feature]
  # belongs_to :project
  # belongs_to :user
end
