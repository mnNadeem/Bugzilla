# frozen_string_literal: true

class RemovePolymorphicAttrsToBugs < ActiveRecord::Migration[5.2]
  change_table :bugs, bulk: true do |t|
    t.remove :bugable_type, :string
    t.remove :bugable_id, :integer
  end
end
