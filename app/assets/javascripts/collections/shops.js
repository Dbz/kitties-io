SpendYourSavings.Collections.Shops = Backbone.Collection.extend({

  model: SpendYourSavings.Models.Shop,
	// initialize: function(options) {
	// 	this.num = options.num;
	// }

});

SpendYourSavings.Collections.FeaturedShops = Backbone.Collection.extend({
	url: 'api/shops/featured_shops/3',
  model: SpendYourSavings.Models.Shop

});
