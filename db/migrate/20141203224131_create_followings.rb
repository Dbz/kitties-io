class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.string :name
      t.references :followable, polymorphic: true

      t.timestamps
    end
  end
end
