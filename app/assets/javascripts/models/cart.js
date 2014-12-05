Kitties.Models.Cart = Backbone.Model.extend({
	
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
				Kitties.cart.set('amount', Kitties.cart.get('amount') - order.get('amount'));
				order.destroy({ data: { order_id: id }, processData: true });
				shop.orders().remove(order);
				if(shop.orders().length == 0)
					this.shops().remove(shop)
				this.trigger("sync");
			}
		}.bind(this));
	},
	
	addOrder: function(listing) {
		var order = this.findOrder(listing.get('id'));
		if(order) {
			if(order.get('amount') + 1 > listing.get('available'))
				return;
			order.set('amount', order.get('amount') + 1);	
			order.save({ data: { listing_id: listing.get('id') } });
		} else {
			order = new Kitties.Models.Order({ amount: 1, listing: listing });
			order.save({ data: { listing_id: listing.get('id') } });
			var shopId = listing.shop().get('id');
			var shop = this.shops().getOrAdd(shopId);
			shop.orders().add(order);
		}
		
		this.set('amount', this.get('amount') + 1);
		this.trigger('sync');
		
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
		this.trigger("sync");
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