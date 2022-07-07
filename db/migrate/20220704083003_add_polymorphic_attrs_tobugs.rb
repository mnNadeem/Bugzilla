# frozen_string_literal: true

class AddPolymorphicAttrsTobugs < ActiveRecord::Migration[5.2]
  change_table :bugs, bulk: true do |t|
    t.column :bugable_type, :string
    t.column :bugable_id, :integer
  end
end
