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