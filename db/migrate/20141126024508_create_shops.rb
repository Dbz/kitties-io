class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :user_id,   null: false
      t.string :name,       null: false
      t.text :description,  null: false
      t.text :policies,     null: false

      t.timestamps
    end
  end
end
