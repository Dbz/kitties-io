class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.string :name
      t.references :taggable, polymorphic: true

      t.timestamps
    end
  end
end
