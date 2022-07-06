# frozen_string_literal: true

class RemovePolymorphicAttrsTobugs < ActiveRecord::Migration[5.2]
  def change
    remove_column :bugs, :bugable_type, :string
    remove_column :bugs, :bugable_id, :integer
  end
end
