Kitties.Models.Cart = Backbone.Model.extend({
	// urlRoot: "api/cart",
	
	url: function () {
		return "api/cart";
	},
	
	initialize: function(options) {
		this.user = options.user;
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
					this.shops().remove(shop)
				Kitties.cart.set('amount', Kitties.cart.get('amount') - order.get('amount'));
				this.trigger("removeOrder");
			}
		}.bind(this));
	},
	
	removeShop: function(id) {
		var shop = this.shops().get(id);
		var numOrders = 0;
		shop.orders().each(function(order) {
			numOrders += order.get('amount');
		});
		shop.orders().pop().destroy({ data: { shop_id: id }, processData: true });
		this.shops().remove(shop);
		this.set('amount', this.get('amount') - numOrders);
		this.trigger("removeShop");
	},
	
	findOrder: function(listingId) {
		var order;
		this.shops().each(function(shop) {
			shop.orders().each(function(currentOrder) {
				if(currentOrder.listing().get('id') == listingId)
					order = currentOrder;
			});	
		});
		return order;
	},
	
	parse: function(data) {
		if(data.shops) {
			this.shops().set(data.shops, { parse: true });
			delete data.shops;
		} 
		return data;
	}

});


Kitties.cart = new Kitties.Models.Cart({ user: Kitties.user });
Kitties.cart.fetch();