class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :discussion, null: false, foreign_key: true

      t.timestamps
    end

    add_index :replies, :created_at
  end
end