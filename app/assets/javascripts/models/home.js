Kitties.Models.Home = Backbone.Model.extend({
	
	shops: function() {
		this._shops = this._shops || new Kitties.Collection.Shops([], {});
		return this._shops;
	},
	
	parse: function(data) {
		if(data.shops) {
			this.shops().set(data.shops, { parse: true });
			delete data.shops;
		}
		return data;
	}
});
