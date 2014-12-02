class UpdateOrder < ActiveRecord::Migration
  def change
    add_column :orders, :amount, :integer, default: 1
  end
end
