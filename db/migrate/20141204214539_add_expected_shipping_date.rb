class AddExpectedShippingDate < ActiveRecord::Migration
  def change
    add_column :shops, :expected_ship_date, :string, default: "3–5 business days"
  end
end
