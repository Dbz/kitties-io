Kitties.Models.Order = Backbone.Model.extend({
	listing: function() {
		this._listing = this._listing || new Kitties.Models.Listing([], {});
		return this._listing
	},
	
	parse: function(data) {
		if(data.listing) {
			this.listing().set(data.listing, { parse: true });
			delete data.listing;
		}
		return data;
	}

});
