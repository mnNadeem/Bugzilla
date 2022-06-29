class Project < ApplicationRecord
  validates_presence_of :title
  has_many :bugs, :dependent => :destroy
  has_and_belongs_to_many :users
end
