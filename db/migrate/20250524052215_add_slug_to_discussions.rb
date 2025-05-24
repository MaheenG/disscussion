class AddSlugToDiscussions < ActiveRecord::Migration[8.0]
  def change
    add_column :discussions, :slug, :string
  end
end
