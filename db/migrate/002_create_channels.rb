class CreateChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :channels do |t|
      t.string :name, null: false
      t.text :description
      t.string :color, default: '#007bff'
      t.string :slug
      t.boolean :archived, default: false

      t.timestamps
    end

    add_index :channels, :name, unique: true
    add_index :channels, :slug, unique: true
  end
end