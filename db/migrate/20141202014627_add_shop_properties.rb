class AddShopProperties < ActiveRecord::Migration
  def change
    add_column :images, :shop_banner, :boolean, default: false
    add_column :shops, :location, :string, default: "This shop has chosen to hide their location"
  end
end
