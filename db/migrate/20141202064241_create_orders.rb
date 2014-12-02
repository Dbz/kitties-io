class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id,     null: false
      t.integer :listing_id,  null: false

      t.timestamps
    end
  end
end
