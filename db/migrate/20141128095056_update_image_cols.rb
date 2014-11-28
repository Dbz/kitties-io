class UpdateImageCols < ActiveRecord::Migration
  def change
    change_column :images, :listing_id, :integer, null: :true
    add_column :images, :user_id, :integer
    add_column :images, :shop_id, :integer
    
    add_index :images, :user_id
    add_index :images, :shop_id
  end
end
