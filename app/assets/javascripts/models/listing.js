SpendYourSavings.Models.Listing = Backbone.Model.extend({
	urlRoot: "api/listings/",
	images: function() {
		this._images = this._images || new SpendYourSavings.Collections.Images([], { listing: this });
		return this._images;
	},
	reviews: function() {
		this._reviews = this._reviews || new SpendYourSavings.Collections.Reviews([], { listing: this });
		return this._reviews;
	},
	
	parse: function(data) {
		if(data.images) {
			this.images().set(data.images);
			delete data.images;
		}
		if(data.reviews) {
			this.reviews().set(data.reviews);
			delete data.reviews;
		}
		return data;
	}
});
