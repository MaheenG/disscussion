class AddColorToChannels < ActiveRecord::Migration[8.0]
  def change
    add_column :channels, :color, :string
  end
end
