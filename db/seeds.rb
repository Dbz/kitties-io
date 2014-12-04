tags = [
  Tag.create(name: "Cats"),
  Tag.create(name: "Apparel"),
  Tag.create(name: "Toys"),
  Tag.create(name: "Gift Ideas"),
  Tag.create(name: "Fan Favorites")
]

User.create(username: "danny", password: "dannydanny")
Image.create(user_id: 1, url: "http://www.hollywoodreporter.com/sites/default/files/imagecache/modal_800/2014/09/too_good_for_grumpy_cat.jpg")

User.create(username: "John", password: "johnjohn")
User.create(username: "Matt", password: "mattmatt")
User.create(username: "Some Dude", password: "somedude")

User.create(username: "Crazy Cat Lady", password: "crazycatlady")
Image.create(user_id: 5, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/crazycatlady2.jpg")

Shop.create(name: "The Animal Auction House", user_id: 1, description: "Buy all of your exotic cats here!", location: "San Fransisco, California",
policies: "
We will ship anywhere and make sure your feline gets to you in purrfect condition!
")

Shop.find(1).tags = [tags[0], tags[4]]

Image.create(shop_id: 1, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/slowloris.jpg")

Listing.create(name: "Ocelot", price: 2000, available: 1, shop_id: 1, description: "Buy this furry friend while he's still around! Ocelot pelts are in high demand due to what wonderful pillows they make")

Listing.find(1).tags = [tags[0], tags[4]]

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

Listing.create(name: "Van Cat", price: 500, available: 27, shop_id: 1, description: "Known for their mismatching eye colors and love of swimming, Van cats are the purrfect pets. This furry companion is a champion snuggler.")

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

Listing.create(name: "Tiger", price: 50000, available: 2, shop_id: 1, description: "Very child friendly tigers. There have been no accidents with either of our current tigers. Unfortunately the white ones are out of stock.")

Listing.find(3).tags = [tags[0], tags[4]]

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

Shop.create(name: "Cats Cats Cats", user_id: 5, description: "I raise cats and then sell them for profit!", location: "San Fransisco, California",
policies: "You must pick up your cat. I will NOT ship it!!")
Image.create(shop_id: 2, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/crazycatlady2.jpg")
Listing.create(shop_id: 2, name: "Norwegian Forest Cat", price: 200, available: 1, description: "Its body shape and double coat are what makes this cat so unique. This dense and long-flowing hair provides excellent protection in the winter (and makes it a soft cuddling partner). The Norwegian Forest Cat's well-balanced body structure, equilateral triangle-shaped head and bright emerald green eyes (with a band of gold) also gives it an aura of mystery, while its broad chest and well-developed muscles display the cat's power and strength.
In addition, the Forest Cat can adapt to the weather and change its coat! During spring, it molts its heavy winter coat and dons a lighter one. In the fall, the cat will again molt and shed its summer coat.")

Listing.find(4).tags = [tags[4]]

Image.create(listing_id: 4, url:"https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/forestcat2optimized.png" , main_img: true)
Image.create(listing_id: 4, url:"https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/forestcat1optimized.png")
Image.create(listing_id: 4, url:"https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/forestcat3optimized.png")


Shop.create(name: "Cat mugs", user_id: 3, description: "Cute Cat Mugs!", location: "Palo Alto, California",
policies: "

#### **IMPORTANT**
Please double check your shipping address before submitting your order, we cannot replace orders sent to an incorrect address.

Orders will be posted to the buyers Kitties.io address within 3 business days and within 5 business days for custom. If you'd like your order posted to a different address, please include at checkout.
")

Shop.find(3).tags = [tags[3]]

Image.create(shop_id: 3, url: "https://img0.etsystatic.com/051/0/30272423/iusa_75x75.28233324_nkpx.jpg")
Listing.create(shop_id: 3, name: "Cute Cat Mugs", price: "20", available: 20, description: "
### Crazy Cat Lady Coffee Mug ###

Our designer mugs make the perfect gift for friends and family or just an extra special treat for your someone special ;) 

#### 11 oz. Coffee Mug ####
+ Design/Image is on both sides of mug.
+ Professional Quality
+ Dishwasher safe (Top Rack)
+ All of the designs are transferred to the mugs using a professional heat press.
+ All items are hand crafted so they may vary slightly from the sample image. 
")

Listing.find(5).tags = [tags[3]]

Image.create(listing_id: 5, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/catmug1optimized.png", main_img: true)
Image.create(listing_id: 5, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/catmug2optimized.png")
Image.create(listing_id: 5, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/catmug3optimized.png")

Review.create(listing_id: 5, stars: 5, user_id: 5, user_name: "Crazy Cat Lady", content: "Wonderful Mugs!!!")

Listing.create(shop_id: 3, name: "Crazy Cat Lady Mug", price: "20", available: 20, description: "
### Crazy Cat Lady Coffee Mug ###

Our designer mugs make the perfect gift for friends and family or just an extra special treat for your someone special ;) 

#### 11 oz. Coffee Mug ####
+ Design/Image is on both sides of mug.
+ Professional Quality
+ Dishwasher safe (Top Rack)
+ All of the designs are transferred to the mugs using a professional heat press.
+ All items are hand crafted so they may vary slightly from the sample image. 
")

Listing.find(6).tags = [tags[3]]

Image.create(listing_id: 6, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/crazycatladymugoptimized.png", main_img: true)
Review.create(listing_id: 6, stars: 5, user_id: 5, user_name: "Crazy Cat Lady", content: "I just had to buy this! It fits my personality :)")


Shop.create(name: "TeesAndTankYou", user_id: 2, description: "Buy all your cat sweaters here!", 
policies: "

Shipping
---
Orders will ship within 1-3 business days after receipt of payment.

Refunds and Exchanges
---
At TeesAndTankYou our goal is your satisfaction. If you are unsatisfied with your purchase, it may be returned for within 14 days of receiving your package.

We cannot accept returns of items that are customer specific designs, worn, altered, laundered or damaged by the purchaser. Items should be in original condition and packaging with all tags and labels as shipped.

Shipping and handling costs are not refundable.

To assure proper credit, all returns are subject to inspection upon receipt.

Mail your garment with a printed email receipt. Ship via insured mail or carrier. Return shipping cost and original shipping and handling are not refundable unless item is manufacturer defective when shipped.

")
Image.create(shop_id: 4, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/teesandtankyoubanner.jpg", shop_banner: true)
Image.create(shop_id: 4, url: "https://img0.etsystatic.com/022/0/35228203/iusa_75x75.25928794_7wa2.jpg")
Listing.create(shop_id: 4, name: "Dashing through the NO", price: 17, available: 100, description:
"

***Tends to run one size bigger***

50% Cotton/50% Polyester Pre-shrunk Fleece

Seamed 1x1 ribbed collar with spandex

Concealed seam on cuffs")

Listing.find(7).tags = [tags[1], tags[3], tags[4]]

Image.create(listing_id: 7, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/dashingthroughthesnowoptimized.png", main_img: true)

Listing.create(shop_id: 4, name: "Meowy Christmas", price: 17, available: 100, description:
"

***Tends to run one size bigger***

50% Cotton/50% Polyester Pre-shrunk Fleece

Seamed 1x1 ribbed collar with spandex

Concealed seam on cuffs")

Listing.find(8).tags = [tags[1]]

Image.create(listing_id: 8, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/meowychristmasoptimized.png", main_img: true)

Listing.create(shop_id: 4, name: "Check Meowt", price: 17, available: 100, description:
"

Made from our exquisite poly viscose, this simple tee's rich and luxuriously soft fabric is designed to drape perfectly and accentuate your figure. 

65% poly-cotton 35% viscose, 30 single 3.7 oz/yd2. (Red Marble and White Marble are made from 91% polyester, 9% combed and ring-spun cotton, 40 single 3.5 oz/yd2.)

Features: Longer body length. Scoop neck. Side-seamed. Easy, drapey fit.

Style: 8816 Bella Women's Flowy Simple Tee")

Listing.find(9).tags = [tags[1]]

Image.create(listing_id: 9, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/checkmeowtoptimized.png", main_img: true)

Shop.create(name: "Professional Cats", user_id: 3, description: "Ties, and whatnot",
policies: "
Shipping
----

Please contact me directly if you need a rush on the production of your order. Your order will ship USPS First Class/First Class international within the quoted time in the item listing. Priority 2-3 Day shipping upgrades are available for US orders only. These upgrades rush the ship time only, not the listed processing time. Tracking information provided in most cases. You may request insurance before purchase for a small fee. You will be notified upon shipment of your purchase. 

International orders usually take from 1-4 weeks to arrive from what I've heard from my customers. The range is due to distance, customs, and who-knows-what that goes on behind the scenes. I have never had an undelivered package in my 5 years shipping through USPS, but some have arrived delayed. 

Buyer is responsible for any taxes, customs charges or other fees resulting from shipping and delivery to their location. Thankfully we have not experienced any problems with this in the past. 

Buying multiple items from the shop at once helps cut shipping costs, so keep that in mind if you're buying gifts or stocking up.

Refunds and Exchanges
---

As a general rule, refunds and exchanges are not accepted. Please contact me if there are any problems or delays in purchase or delivery.
")

Shop.find(5).tags = [tags[1]]

Image.create(shop_id: 5, url: "https://img0.etsystatic.com/000/0/6054069/iusa_75x75.6643874.jpg")

Listing.create(shop_id: 5, name: "Cat Ties", price: 15, available: 250,
description: "

\"Class up your cat\" 
There's nothing like a new suit and tie to make a man feel sharp. \"But what about my cat?\", many loving cat-owners ask themselves. \"Doesn't he deserve to feel sharp?\" Of course he does. 
These collars feature a white shirt collar with a classic tie and a black elastic band. (See below for links to other prints) They are comfortable, washable, and stylish. What more could your handsome friend ever ask for? 

My Charlie has worn them exclusively as his collar for over 2 years now. I created the original bow tie for a black and white party I hosted, my cat hates all collars so I figured it would be on for an hour tops. To my surprise he wore it happily after about 30 minutes of adjustment from no collar at all. They must be more comfortable for cats than regular collars, as they are elastic, snug enough to not fall off, but not too tight and very light weight. I've found from Charlie and customers' feedback that it can take up to a day of adjustment, where the cat may fiddle with it a bit, but they seem to adjust, so far in every case. It is smaller than other cat ties and bow ties out there (in my opinion more proportionate to the cat) which helps with the comfort as well.
I love these collars and I'm happy to answer any questions :)
See customer photos here: http://www.chariots-afire-cats.tumblr.com

The first picture features the light blue stripe tie.

Care Instructions
---

Machine Wash
Tumble Dry

Handmade in the USA
===
")

Listing.find(10).tags = [tags[1], tags[2], tags[3]]

Image.create(listing_id: 10, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/cattie1optimized.png", main_img: true)
Image.create(listing_id: 10, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/cattie2optimized.png")
Image.create(listing_id: 10, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/cattie3optimzed.png")
Image.create(listing_id: 10, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/cattie4optimized.png")


Listing.create(shop_id: 4, name: "Meowy Christmas", price: 17, available: 100, description:
"

***Tends to run one size bigger***

50% Cotton/50% Polyester Pre-shrunk Fleece

Seamed 1x1 ribbed collar with spandex

Concealed seam on cuffs")
Image.create(listing_id: 11, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/meowychristmasoptimized.png", main_img: true)


Listing.create(shop_id: 4, name: "Meowy Christmas", price: 17, available: 100, description:
"

***Tends to run one size bigger***

50% Cotton/50% Polyester Pre-shrunk Fleece

Seamed 1x1 ribbed collar with spandex

Concealed seam on cuffs")
Image.create(listing_id: 12, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/meowychristmasoptimized.png", main_img: true)

Listing.create(shop_id: 4, name: "Meowy Christmas", price: 17, available: 100, description:
"

***Tends to run one size bigger***

50% Cotton/50% Polyester Pre-shrunk Fleece

Seamed 1x1 ribbed collar with spandex

Concealed seam on cuffs")
Image.create(listing_id: 13, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/meowychristmasoptimized.png", main_img: true)

Listing.create(shop_id: 4, name: "Meowy Christmas", price: 17, available: 100, description:
"

***Tends to run one size bigger***

50% Cotton/50% Polyester Pre-shrunk Fleece

Seamed 1x1 ribbed collar with spandex

Concealed seam on cuffs")
Image.create(listing_id: 14, url: "https://s3-us-west-1.amazonaws.com/spendyoursavingsimages/meowychristmasoptimized.png", main_img: true)


