# frozen_string_literal: true

class AddPolymorphicAttrsTobugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :bugable_type, :string
    add_column :bugs, :bugable_id, :integer
  end
end
