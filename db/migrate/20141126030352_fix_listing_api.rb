class FixListingApi < ActiveRecord::Migration
  def change
    remove_column :api_listings, :reviews
    remove_column :api_listings, :policies
  end
end
