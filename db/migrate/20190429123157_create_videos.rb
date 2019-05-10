class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :iframe_url
      t.string :skater
      t.string :trick
      t.string :instagram_url
      t.string :video_url
      t.string :video_type

      t.timestamps
    end
  end
end
