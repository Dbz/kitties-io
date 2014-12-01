json.array! @listings do |listing|
  json.extract! listing, :id, :name, :price
  
  json.image do
    json.extract! listing.main_image, :id, :url
  end
  
  json.shop do
    json.extract! listing.shop, :id, :name
  end
end