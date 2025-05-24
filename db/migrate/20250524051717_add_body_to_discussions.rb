class AddBodyToDiscussions < ActiveRecord::Migration[8.0]
  def change
    add_column :discussions, :body, :text
  end
end
