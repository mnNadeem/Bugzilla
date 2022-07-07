# frozen_string_literal: true

class AddColumnToProject < ActiveRecord::Migration[5.2]
  def change
    change_table :projects, bulk: true do |t|
      t.column :title, :string
      t.column :description, :text
    end
  end
end
