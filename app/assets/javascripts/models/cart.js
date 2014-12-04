Kitties.Models.Cart = Backbone.Model.extend({
	urlRoot: "api/cart",
	initialize: function(options) {
		this.user_id = options.user_id;
	},
	
	shops: function() {
		this._shops = this._shops || new Kitties.Collections.Shops([], {});
		return this._shops;
	},
	
	removeOrder: function(id) {
		this.shops().each(function(shop) {
			var order = shop.orders().get(id);
			if(order) {
				order.destroy({ data: { order_id: id }, processData: true });
				shop.orders().remove(order);
				if(shop.orders().length == 0)
					this.removeShop(shop.get('id'));
				this.trigger("removeOrder");
			}
		}.bind(this));
	},
	
	removeShop: function(id) {
		var shop = this.shops().get(id);
		shop.destroy({ data: { shop_id: id }, processData: true });
		this.shops().remove(shop);
		this.trigger("removeShop");
	},
	
	parse: function(data) {
		if(data.shops) {
			this.shops().set(data.shops, { parse: true });
			delete data.shops;
		} 
		return data;
	}

});


Kitties.cart = new Kitties.Models.Cart({ user_id: Kitties.user_id });