class CreateSyntaxHighlights < ActiveRecord::Migration[8.0]
  def change
    create_table :syntax_highlights do |t|
      t.integer :content_id
      t.string :content_type
      t.text :code
      t.string :language

      t.timestamps
    end

    # Important for performance of polymorphic association
    add_index :syntax_highlights, [:content_id, :content_type]
  end
end
