SpendYourSavings.Models.Shop = Backbone.Model.extend({
	urlRoot: "/api/shops",
	initialize: function(options) {
		this.randomProductList = []; // Stores each listing from calling randomProduct()
		// this.listings().fetch();
	},
	
	reviews: function() {
		this._reviews = this._reviews || new SpendYourSavings.Collections.Reviews([], {});
		return this._reviews;
	},
	
	listings: function() {
		this._listings = this._listings || new SpendYourSavings.Collections.Listings([], {});
		return this._listings;
	},
	
	parse: function(data) {
		if(data.listings) {
			this.listings().set(data.listings, { parse: true });
			delete data.listings;
		}
		if(data.reviews) {
			this.reviews().set(data.reviews, { parse: true });
			delete data.reviews;
		}
		return data
	}
	
});
