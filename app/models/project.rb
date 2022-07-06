# frozen_string_literal: true

class Project < ApplicationRecord
  validates :title, presence: true
  has_many :bugs
  has_and_belongs_to_many :users
end
