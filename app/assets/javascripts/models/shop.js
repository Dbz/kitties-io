Kitties.Models.Shop = Backbone.Model.extend({
	urlRoot: "/api/shops",
	
	reviews: function() {
		this._reviews = this._reviews || new Kitties.Collections.Reviews([], {});
		return this._reviews;
	},
	
	listings: function() {
		this._listings = this._listings || new Kitties.Collections.Listings([], {});
		return this._listings;
	},
	
	user: function() {
		this._user = this._user || new Kitties.Models.User({}, {});
		return this._user;
	},
	
	image: function() {
		this._image = this._image || new Kitties.Models.Image({}, {});
		return this._image;
	},
	
	banner: function() {
		this._banner = this._banner || new Kitties.Models.Image({}, {});
		return this._banner;
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
		if(data.banner) {
			var bannerParams = this.banner().parse(data.banner);
			this.banner().set(bannerParams);
			delete data.banner;
		}
		return data;
	}
});
