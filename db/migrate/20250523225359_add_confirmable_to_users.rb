class AddConfirmableToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string # Only if using reconfirmable

    add_index :users, :confirmation_token, unique: true

    # If you want, you can also backfill confirmed_at for existing users
    # User.update_all(confirmed_at: Time.current)
  end
end
