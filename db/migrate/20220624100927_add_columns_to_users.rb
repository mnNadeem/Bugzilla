# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.column :name, :string
      t.column :role, :integer, default: 0
    end
  end
end
