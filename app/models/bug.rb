# frozen_string_literal: true

class Bug < ApplicationRecord
  validates :title, :status, :bug_type, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 20 }, format: { with: /\A\D+\z/, message: 'Numbers are not allowed' }
  has_one_attached :screenshot
  validates :title, uniqueness: true
  # validates :screenshot, allow_blank: true, format: { with: %r{.(gif|png)\Z}i, message: 'must be a URL for GIF or PNG image.'}
  enum bug_type: { bug_t: 0, feature: 1 }
  enum status: { new: 0, started: 1, completed: 2, resolved: 3 }, _suffix: true
  enum comments_status: { new: 0, started: 1, resolved: 2 }, _prefix: :comments
  belongs_to :project, optional: true
  belongs_to :user, optional: true
end
