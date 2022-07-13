# frozen_string_literal: true

class Project < ApplicationRecord
  paginates_per 5
  validates :title, presence: true
  validates :title, length: { maximum: 20 }, format: { with: /\A\D+\z/, message: 'Numbers are not allowed' }
  validates :description, length: { maximum: 30 }
  has_many :bugs, dependent: :destroy
  has_and_belongs_to_many :users
end
