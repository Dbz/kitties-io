class AddTagIdToTaggings < ActiveRecord::Migration
  def change
    add_column :taggings, :tag_id, :integer, null: false
  end
end
