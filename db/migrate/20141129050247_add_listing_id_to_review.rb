class AddListingIdToReview < ActiveRecord::Migration
  def change
    remove_column :reviews, :shop_id
    add_column :reviews, :listing_id, :integer, null: false
  end
end
