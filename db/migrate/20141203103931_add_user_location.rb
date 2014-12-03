class AddUserLocation < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, default: "User has hidden their location"
  end
end
