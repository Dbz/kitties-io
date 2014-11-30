# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "danny", password: "dannydanny")
Image.create(user_id: 1, url: "http://www.hollywoodreporter.com/sites/default/files/imagecache/modal_800/2014/09/too_good_for_grumpy_cat.jpg")

User.create(username: "john", password: "johnjohn")
User.create(username: "matt", password: "mattmatt")
User.create(username: "Some Dude", password: "somedude")

User.create(username: "Crazy Cat Lady", password: "crazycatlady")
Image.create(user_id: 5, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/crazycatlady.jpg")

Shop.create(name: "The Animal Auction House", user_id: 1, description: "Buy all of your exotic animals here!", policies: "We will ship anywhere and make sure whatever you buy gets to you in the condition you bought it")
Image.create(shop_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/slowloris.jpg")

Listing.create(name: "Ocelot", price: 12, available: 1, shop_id: 1, description: "Buy this furry friend while he's still around! Ocelot pelts are in high demand due to what wonderful pillows they make")

Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/sleepyocelot2.png", main_img: true)
Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/philosophyocelot2.png")
Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/crouchingocelot2.png")

Review.create(
  content: "I tried to take my Chimpanzee with me through the airport dressed up as a child in a stroller. I GOT ARRESTED!! I wasn't warned that this would happen and it was an awful experience.",
  stars: 1,
  listing_id: 1,
  user_name: "John",
  user_id: 2
)
Review.create(
  content: "My ferrit siphoned gas out of my neighbors car. Who knew they could do that?!",
  stars: 4,
  listing_id: 1,
  user_name: "Matt",
  user_id: 3
)
Review.create(
  content: "BEST SELLER ON HERE",
  stars: 5,
  listing_id: 1,
  user_name: "Some Dude",
  user_id: 4
)

Listing.create(name: "Van Cat", price: 5, available: 27, shop_id: 1, description: "Known for their mismatching eye colors and love of swimming, Van cats are the purrfect pets. This furry companion is a champion snuggler.")
Image.create(listing_id: 2, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/vancat1optimized.png", main_img: true)
Image.create(listing_id: 2, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/vancat3optimized.png")
Image.create(listing_id: 2, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/vancat2optimized.png")

Review.create(
  content: "This is an amazing seller. I bought my Van Cat from her and she came exactly as promised. One eye blue, one eye green, and she loves to swim with me! I'm definitely buying another once this one dies!",
  stars: 5,
  listing_id: 2,
  user_name: "Danny",
  user_id: 1
)

Listing.create(name: "Tiger", price: 200, available: 2, shop_id: 1, description: "Very child friendly tigers. There have been no accidents with either of our current tigers. Unfortunately the white ones are out of stock.")
Image.create(listing_id: 3, url:"https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/tiger1optimized.png", main_img: true)
Image.create(listing_id: 3, url:"https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/tiger3optimzed.png")
Image.create(listing_id: 3, url:"https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/tiger2optimized.png")
Image.create(listing_id: 3, url:"https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/tiger4optimized.png")

Review.create(
  content: "THE TIGER ATE MY VAN CAT! SELLER WOULD NOT REFUND OR EXCHANGE!!!1!",
  stars: 0,
  listing_id: 3,
  user_name: "Danny",
  user_id: 1
)

Review.create(
  content: "These tigers are very aggressive. Unfortunately I had it skinned but now we have a beautiful white tiger rug in front of the fire. Very friendly seller.",
  stars: 4,
  listing_id: 3,
  user_name: "Crazy Cat Lady",
  user_id: 5
)

