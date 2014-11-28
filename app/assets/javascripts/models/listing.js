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
	shop: function() {
		this._shop = this._shop || new SpendYourSavings.Models.Shop([], { listing: this });
		return this._shop;
	},
	
	
	parse: function(data) {
		if(data.images) {
			this.images().set(data.images, { parse: true });
			delete data.images;
		}
		if(data.reviews) {
			this.reviews().set(data.reviews, { parse: true });
			delete data.reviews;
		}
		if(data.shop) {
			this.shop().set(data.shop, { parse: true });
			delete data.shop;
		}
		return data;
	},
	
	mainImage: function() {
		var main;
		this.images().each(function(image) {
			if(image.get('main_img'))
				main = image;
		});
		return main || new SpendYourSavings.Models.Image();
	}
});
