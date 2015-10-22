class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.belongs_to :theme, index: true
      t.belongs_to :user, index: true
      t.string :location, index: true
      t.string :title
      t.string :background_color
      t.string :stream_url
      t.string :url_sd
      t.string :url_hd
      t.integer :duration
      t.string :thumbnail_url
      t.string :hal_id, index: true
      t.timestamps null: false
    end
  end

  def down
    drop_table :videos
  end
end
