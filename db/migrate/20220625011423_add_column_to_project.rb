# frozen_string_literal: true

class AddColumnToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :title, :string
    add_column :projects, :description, :text
  end
end
