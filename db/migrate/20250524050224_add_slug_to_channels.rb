class AddSlugToChannels < ActiveRecord::Migration[8.0]
  def change
    add_column :channels, :slug, :string
  end
end
