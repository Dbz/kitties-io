json.extract! @listing, :id, :name, :price, :available, :shop_id, :description

json.images do
  json.array! @listing.images do |image|
    json.extract! image, :id, :url, :main_img
  end
end

json.reviews do
  json.array! @listing.reviews do |review|
    json.extract! review, :id, :content, :stars, :shop_id, :user_name, :user_id, :updated_at
    json.user do
      json.extract! review.user, :id, :username
      json.extract! review.user.image, :url
    end
  end
end


