class AddDeveloperToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :developer, :integer, array: true, default: []
  end
end
