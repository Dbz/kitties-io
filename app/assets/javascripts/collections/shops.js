Kitties.Collections.Shops = Backbone.Collection.extend({

  model: Kitties.Models.Shop,
	
	getOrAdd: function(id) {
		// var shop = this.get(id);
		// if(!shop) {
		// 	shop = new Kitties.Models.Shop({id: id});
		// 	shop.save({}, function() {
		// 		success: (function() {
		// 			this.add(shop);
		// 		}).bind(this)
		// 	});
		// } else {
		// 	shop.fetch();
		// }
		// return shop;
		var shop = this.get(id)
		if(!shop) {
			shop = new Kitties.Models.Shop({ id: id });
		}
		shop.fetch();
		return shop;
	}

});

Kitties.Collections.FeaturedShops = Backbone.Collection.extend({
	url: 'api/shops/featured_shops/3',
  model: Kitties.Models.Shop

});
