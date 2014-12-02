Kitties.Collections.Shops = Backbone.Collection.extend({

  model: Kitties.Models.Shop,
	// initialize: function(options) {
	// 	this.num = options.num;
	// }

});

Kitties.Collections.FeaturedShops = Backbone.Collection.extend({
	url: 'api/shops/featured_shops/3',
  model: Kitties.Models.Shop

});
