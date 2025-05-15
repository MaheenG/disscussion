class CreateAdminPermissions < ActiveRecord::Migration[8.0]
  def change
    create_table :admin_permissions do |t|
      t.references :admin, null: false, foreign_key: { to_table: :users }
      t.references :discussion, foreign_key: true, null: true
      t.references :reply, foreign_key: true, null: true

      t.timestamps
    end
  end
end
