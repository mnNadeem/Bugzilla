# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable,:lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :email, presence: true
  validates :role, presence: true
  has_and_belongs_to_many :projects
  has_many :bugs, dependent: :destroy
  enum role: { manger: 0, developer: 1, qa: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
end
