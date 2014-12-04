json.extract! @cart, :id, :user_id, :amount
json.shops do
  json.array! @cart.shops.uniq do |shop|
    json.extract! shop, :id, :name, :expected_ship_date
    json.orders do
      json.array! @cart.orders_by_shop(shop.id) do |order|
        json.extract! order, :id, :amount
        json.listing do
          json.extract! order.listing, :id, :name, :price
          json.images do
            json.extract! order.listing.main_image, :id, :url, :main_img
          end
        end
      end
    end
  end
end

