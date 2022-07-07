# frozen_string_literal: true

class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    change_table :users, bulk: true do |t|
      t.column :confirmation_token, :string
      t.column :confirmed_at, :datetime
      t.column :confirmation_sent_at, :datetime
      t.column :unconfirmed_email, :string # Only if using reconfirmable
      t.index  :confirmation_token, unique: true
      # User.reset_column_information # Need for some types of updates, but not for update_all.
      # To avoid a short time window between running the migration and updating all existing
      # users as confirmed, do the following
      # User.update_all confirmed_at: DateTime.now
      # All existing user accounts should be able to log in after this.
    end
  end

  def down
    change_table :users, bulk: true do |t|
      t.index :confirmation_token
      t.remove :confirmation_token, :confirmed_at, :confirmation_sent_at
      t.remove :unconfirmed_email # Only if using reconfirmable
    end
  end
end
