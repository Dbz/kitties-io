class ChangeReviewerIdToName < ActiveRecord::Migration
  def change
    remove_column :reviews, :user_id
    add_column :reviews, :user_name, :string, null: false
  end
end
