class FixReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :listing_id
    add_column :reviews, :shop_id, :integer
  end
end
