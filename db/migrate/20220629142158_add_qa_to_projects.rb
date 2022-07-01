class AddQaToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :qa, :integer, array: true, default: []
  end
end
