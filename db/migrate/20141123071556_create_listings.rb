class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name,       null: false
      t.integer :price,     null: false
      t.integer :available, null: false
      t.integer :reviews,   default: 0
      t.integer :shop_id,   null: false
      t.text :description,  null: false
      t.text :policies,     null: false

      t.timestamps
    end
  end
end
