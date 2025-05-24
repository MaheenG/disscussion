class CreateDiscussions < ActiveRecord::Migration[7.0]
  def change
    create_table :discussions do |t|
      t.string :title, null: false
      t.text :content
      t.boolean :pinned, default: false
      t.boolean :closed, default: false
      t.string :slug
      t.references :user, null: false, foreign_key: true
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end

    add_index :discussions, :slug, unique: true
    add_index :discussions, :pinned
    add_index :discussions, :created_at
  end
end
