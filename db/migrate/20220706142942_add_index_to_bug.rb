# frozen_string_literal: true

class AddIndexToBug < ActiveRecord::Migration[5.2]
  def change
    add_index :bugs, :title, unique: true
  end
end
