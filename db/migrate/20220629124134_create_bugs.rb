class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title, null: false
      t.date :deadline
      t.string :screenshot
      t.integer :type, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
