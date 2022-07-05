class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false, unique: true
      t.date :deadline
      t.string :screenshot
      t.integer :bug_type, null: false
      t.integer :status, null: false
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
end
