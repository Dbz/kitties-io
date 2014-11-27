# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Shop.create(name: "The Animal Auction House", user_id: 1, description: "Buy all of your exotic animals here!", policies: "We will ship anywhere and make sure whatever you buy gets to you in the condition you bought it")

Listing.create(name: "Ocelot", price: 12, available: 1, shop_id: 1, description: "Buy this furry friend while he's still around! Ocelot pelts are in high demand due to what wonderful pillows they make")

Image.create(listing_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/philosophyocelot2.png?X-Amz-Date=20141127T064958Z&X-Amz-Expires=300&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Signature=1f31b4aac170e2af93c0f2d01a4f615b1605b6b5e32414a7ac3c65ca5ceaf840&X-Amz-Credential=ASIAJW3JVW6ZMNPP3XPA/20141127/us-west-1/s3/aws4_request&X-Amz-SignedHeaders=Host&x-amz-security-token=AQoDYXdzEOH//////////wEakAIs8KXPoeWa0uyzaB8jXLNgpM8otvviUexs/oVzH77a0sgutreZJRD%2BDJ6ECuc0eGFTSt6q2pNXPjXW7s8xPJ75stYal4s7Cy3t3SFQyYGUyrPPIulX5r0h1mDshhP46Iy0jNW%2BWvMih49iNJ9M%2BWGZVYNX/ii3KGz8X5kywE5nnTC5MAm9s4tkWHIaN1L0poemjd9QwaCJs6pOlFnfg%2B11XB8RMd2pd00HSYDc/IKHQ%2Bvtv2thHhBym4vueExkxosj%2BXR9lPUmR5Cp36yFPwPNsHufDyIYKwYmUbn2xITWQSH8A1frzo0TdcCrSuFQ1sL9zer0g9sZYhf4Gi30RY%2B/qiSMF2lF7dog8l725XKCsSDBwtmjBQ%3D%3D")
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

