json.array! @shops do |shop|
  json.extract! shop, :id, :description, :policies
  
  json.user do
    json.extract! shop.user, :id, :username
    json.extract! shop.user.image, :url
  end

  json.reviews do
  	json.array! shop.reviews do |review|
      json.extract! review, :id, :content, :stars, :shop_id, :user_name, :user_id, :updated_at
    end
  end

  json.listings do
    json.array! shop.listings do |listing|
      json.extract! listing, :id, :name, :price, :available, :shop_id, :description
      
      json.images do
        json.array! listing.images do |image|
          json.extract! image, :id, :url, :main_img
        end
      end
    end
  end
end