# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[8.0]
  def self.up
    change_table :users do |t|
      unless column_exists?(:users, :email)
        t.string :email, null: false, default: ""
      end

      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
      end

      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      # Add other Devise columns with similar checks here if needed
    end

    add_index :users, :email, unique: true unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
    # Add other indexes as needed
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
