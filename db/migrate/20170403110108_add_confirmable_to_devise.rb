class AddConfirmableToDevise < ActiveRecord::Migration[5.0]
  # this adds these three coolumns to the database
  def up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime

    add_index :users, :confirmation_token, unique: true
  end
  # if we want to remove the previous columns this will allow us to do that.
  def down
    remove_column :users, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
