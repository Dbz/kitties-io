class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id,     null: false
      t.integer :listing_id,  null: false
      t.text :content,        null: false
      t.integer :stars,       null: false

      t.timestamps
    end
  end
end
