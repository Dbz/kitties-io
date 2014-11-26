class FixListing < ActiveRecord::Migration
  def change
    remove_column :listings, :reviews
    remove_column :listings, :policies
  end
end
