# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Shop.create(name: "The Auction House", user_id: 1, description: "Buy all of your rare items here!", policies: "We will ship anywhere and make sure whatever you buy gets to you in the condition you bought it")

Listing.create(name: "Ocelot", price: 12, available: 1, shop_id: 1, description: "Buy this furry friend while he's still around! Ocelot pelts are in high demand due to what wonderful pillows they make")
Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/ocelot.jpg")
