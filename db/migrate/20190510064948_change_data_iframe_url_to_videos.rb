class ChangeDataIframeUrlToVideos < ActiveRecord::Migration[5.0]
  def change
    change_column :videos, :iframe_url, :text
  end
end
