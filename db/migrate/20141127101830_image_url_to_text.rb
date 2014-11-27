class ImageUrlToText < ActiveRecord::Migration
  def change
    change_column :images, :url, :text, limit: nil
  end
end
