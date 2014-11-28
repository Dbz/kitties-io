class FixMainImg < ActiveRecord::Migration
  def change
    remove_column :images, :main_img
    add_column :images, :main_img, :boolean, default: false
  end
end
