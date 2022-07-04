class AddProjecttobugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :project
  end
end
