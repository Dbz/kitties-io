json.extract! @listing, :id, :name, :price, :available, :shop_id, :description

json.images do
  json.array! @listing.images do |image|
    json.extract! image, :id, :url, :main_img
  end
end

json.reviews do
  json.array! @listing.reviews do |review|
    json.extract! review, :id, :content, :stars, :listing_id, :user_name, :user_id, :updated_at
    json.user do
      json.extract! review.user, :id, :username
      json.extract! review.user.image, :url
    end
  end
end

json.shop do
  json.extract! @listing.shop, :id, :name, :policies
  json.image @listing.shop.image, :id, :url
  json.listings do
    json.array! @listing.shop.listings.sample(4) do |listing|
      json.extract! listing, :id, :name, :price
      json.extract! listing.main_image, :url
    end
  end
end

json.tags do
  json.array! @listing.tags do |tag|
    json.extract! tag, :name
  end
end