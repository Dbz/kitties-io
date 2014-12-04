Kitties.Views.CartShow = Backbone.View.extend({

  template: JST['carts/show'],
	className: "cart-show",
	
	initialize: function(optioins) {
		this.listenTo(this.collection, "sync", this.render);
		this.listenTo(this.model, "all", this.render);
	},
	
	events: {
		"click .close-button": "removeShopFromCart",
		"click .remove-listing-button": "removeListingFromCart"
	},
	
	removeShopFromCart: function(event) {
		event.preventDefault();
		Kitties.cart.removeShop($(event.currentTarget).data('shop-id'));
	},
	
	removeListingFromCart: function(event) {
		event.preventDefault();
		Kitties.cart.removeOrder($(event.currentTarget).data('order-id'));
	},
	
	render: function() {
		var templateCode = this.template({ shops: this.collection });
		this.$el.html(templateCode);
		
		return this;
	}

});
