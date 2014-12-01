json.array! @listings do |listing|
  json.extract! listing, :id, :name, :price
  
  json.images do
    json.extract! listing.main_image, :id, :url, :main_img
  end
  
  json.shop do
    json.extract! listing.shop, :id, :name
  end
end