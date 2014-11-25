SpendYourSavings.Models.Listing = Backbone.Model.extend({
	urlRoot: "api/listings/",
	images: function() {
		this._images = this._images || new SpendYourSavings.Collections.Images([], { listing: this });
		return this._images;
	},
	
	parse: function(data) {
		if(data.images) {
			debugger
			this.images().set(data.images);
			delete data.images;
		}
		return data;
	}
});
