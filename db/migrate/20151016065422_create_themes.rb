class CreateThemes < ActiveRecord::Migration
  def up
    create_table :themes do |t|
      t.string :name
      t.string :class_name, index: true
      t.boolean :active, default: false
      t.text :thumbnail_url
      t.timestamps null: false
    end
  end

  def down
    drop_table :themes
  end
end
