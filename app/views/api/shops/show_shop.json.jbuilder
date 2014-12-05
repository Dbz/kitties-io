json.extract! @shop, :id, :description, :policies, :name, :location
  
json.image do
  json.extract! @shop.image, :id, :url
end

if @shop.banner
  json.banner do
    json.extract! @shop.banner, :id, :url
  end
end
  
json.user do
  json.extract! @shop.user, :id, :username
  json.image do
    json.extract! @shop.user.image, :url
  end
end

json.reviews do
	json.array! @shop.reviews do |review|
    json.extract! review, :id, :content, :stars, :listing_id, :user_name, :user_id, :updated_at
  end
end

json.listings do
  json.array! @shop.listings do |listing|
    json.extract! listing, :id, :name, :price, :available, :shop_id, :description
    json.images do
      json.extract! listing.main_image, :id, :url, :main_img
    end
  end
end