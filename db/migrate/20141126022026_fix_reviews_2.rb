class FixReviews2 < ActiveRecord::Migration
  def change
    remove_column :reviews, :shop_id
    add_column :reviews, :shop_id, :integer, null: false
  end
end
