json.extract! @cart, :id, :user_id
json.orders do
  json.array! @cart.orders do |order|
    json.extract! order, :id, :amount
    json.listing do
      json.extract! order.listing, :id, :name, :price
    end
  end
end