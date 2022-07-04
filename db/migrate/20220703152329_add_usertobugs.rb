class AddUsertobugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :user
  end
end
