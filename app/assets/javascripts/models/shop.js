SpendYourSavings.Models.Shop = Backbone.Model.extend({
	urlRoot: "/api/shops",
	
	reviews: function() {
		this._reviews = this._reviews || new SpendYourSavings.Collections.Reviews([], {});
		return this._reviews;
	},
	
	listings: function() {
		this._listings = this._listings || new SpendYourSavings.Collections.Listings([], {});
		return this._listings;
	},
	
	user: function() {
		this._user = this._user || new SpendYourSavings.Models.User({}, {});
		return this._user;
	},
	
	image: function() {
		this._image = this._image || new SpendYourSavings.Models.Image({}, {});
		return this._image
		// return this.get('image') || new SpendYourSavings.Models.Image({}, {});
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
		if(data.user) {
			var userParams = this.user().parse(data.user);
			this.user().set(userParams);
			delete data.user;
		}
		if(data.image) {
			var imageParams = this.image().parse(data.image);
			this.image().set(imageParams);
			delete data.image;
		}
		return data;
	}
});
