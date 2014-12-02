Kitties.Models.Cart = Backbone.Model.extend({
	urlRoot: "api/cart",
	initialize: function(options) {
		this.user_id = options.user_id;
	},
	
	shops: function() {
		this._shops = this._shops || new Kitties.Collections.Shops([], {});
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
