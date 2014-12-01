SpendYourSavings.Collections.Listings = Backbone.Collection.extend({

  model: SpendYourSavings.Models.Listing,
	url: "api/listings",
	
	getOrFetch: function(id) {
		var listing = this.get(id);
		if(!listing) {
			listing = new SpendYourSavings.Models.Listing({id: id});
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

SpendYourSavings.Collections.SearchListings = Backbone.Collection.extend({

  model: SpendYourSavings.Models.Listing,
	url: "api/listings/search" // ?search%5Btext%5D=
	
});