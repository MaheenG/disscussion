class CreateSlugs < ActiveRecord::Migration[8.0]
  def change
    create_table :slugs do |t|
      t.references :discussion, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
