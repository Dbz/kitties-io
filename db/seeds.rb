# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "danny", password: "dannydanny")
Image.create(user_id: 1, url: "http://www.hollywoodreporter.com/sites/default/files/imagecache/modal_800/2014/09/too_good_for_grumpy_cat.jpg")

Shop.create(name: "The Animal Auction House", user_id: 1, description: "Buy all of your exotic animals here!", policies: "We will ship anywhere and make sure whatever you buy gets to you in the condition you bought it")

Listing.create(name: "Ocelot", price: 12, available: 1, shop_id: 1, description: "Buy this furry friend while he's still around! Ocelot pelts are in high demand due to what wonderful pillows they make")

Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/philosophyocelot2.png")
Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/crouchingocelot2.png")
Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/sleepyocelot2.png")

Review.create(
  content: "This is an amazing seller. I bought my Van Cat from her and she came exactly as promised. One eye blue, one eye green, and she loves to swim with me! I'm definitely buying another once this one dies!",
  stars: 5,
  shop_id: 1,
  user_name: "Danny",
  user_id: 1
)
Review.create(
  content: "I tried to take my Chimpanzee with me through the airport dressed up as a child in a stroller. I GOT ARRESTED!! I wasn't warned that this would happen and it was an awful experience.",
  stars: 1,
  shop_id: 1,
  user_name: "John",
  user_id: 2
)
Review.create(
  content: "My ferrit siphoned gas out of my neighbors car. Who knew they could do that?!",
  stars: 4,
  shop_id: 1,
  user_name: "Matt",
  user_id: 3
)
Review.create(
  content: "BEST SELLER ON HERE",
  stars: 5,
  shop_id: 1,
  user_name: "Some Dude",
  user_id: 4
)

# Listing.create(name: "Van Cat", price: 5, available: 27, shop_id: 1, description: "Known for their mismatching eye colors and love of swimming, Van cats are the purrfect pets. This furry companion is a champion snuggler.")

