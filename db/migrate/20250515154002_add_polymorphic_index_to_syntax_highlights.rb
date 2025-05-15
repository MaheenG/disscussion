
class AddPolymorphicIndexToSyntaxHighlights < ActiveRecord::Migration[8.0]
  def change
    unless index_exists?(:syntax_highlights, [:content_id, :content_type])
      add_index :syntax_highlights, [:content_id, :content_type]
    end
  end
end
