SpendYourSavings.Models.Review = Backbone.Model.extend({
	initialize: function(options) {
		var listing = new SpendYourSavings.Models.Listing({ id: options.listing_id });
		listing.fetch();
		this.listing = listing;
	}
});
