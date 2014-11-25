class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :listing_id,  null: false
      t.string :url,          null: false
      t.integer :main_img

      t.timestamps
    end
    add_index :images, :listing_id
  end
end
