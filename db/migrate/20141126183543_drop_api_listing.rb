class DropApiListing < ActiveRecord::Migration
  def change
    drop_table :api_listings
  end
end
