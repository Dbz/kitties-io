Kitties.Collections.Listings = Backbone.Collection.extend({

  model: Kitties.Models.Listing,
	url: "api/listings",
	
	getOrFetch: function(id) {
		var listing = this.get(id);
		if(!listing) {
			listing = new Kitties.Models.Listing({id: id});
			listing.save({}, function() {
				success: (function() {
					this.add(listing);
				}).bind(this)
			});
		} else {
			listing.fetch();
		}
		return listing;
	}

});

Kitties.Collections.SearchListings = Backbone.Collection.extend({

  model: Kitties.Models.Listing,
	url: "api/listings/search" // ?search%5Btext%5D=
	
});

Kitties.Collections.SearchShopListings = Backbone.Collection.extend({
	
	initialize: function(options) {
		this.shop_id = options.shop_id
	},

  model: Kitties.Models.Listing,
	url: function() {
		return "api/shops/" + this.shop_id + "/search"
	}

});