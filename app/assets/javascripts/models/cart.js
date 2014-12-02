Kitties.Models.Cart = Backbone.Model.extend({
	urlRoot: "api/cart",
	initialize: function(options) {
		this.user_id = options.user_id;
	},
	
	orders: function() {
		this._orders = this._orders || new Kitties.Collections.Orders([], {});
		return this._orders;
	},
	
	parse: function(data) {
		if(data.orders) {
			this.orders().set(data.orders, { parse: true });
			delete data.orders;
		}
		return data;
	}

});
