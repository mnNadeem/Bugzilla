class Bug < ApplicationRecord
  validates_presence_of :title, :status, :bug_type
  validates :title, length: { maximum: 20 }, format: { with: /\A\D+\z/, message: "Numbers are not allowed" }
  has_one_attached :screenshot
  validates :title, uniqueness: true
  # validates :screenshot, format: { with: %r{\.(gif|png)\Z}i, message: 'Screenshot type should be GIF or PNG image.'}
  enum bug_type: [:bug_t, :feature]
  enum status: [:new,:started,:completed,:resolved], _suffix: true
  enum comments_status: [:new,:started,:resolved], _prefix: :comments
  belongs_to :project, optional: true
  belongs_to :user, optional: true
end
