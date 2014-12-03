Kitties.Views.CartShow = Backbone.View.extend({

  template: JST['carts/show'],
	className: "cart-show",
	
	initialize: function(optioins) {
		this.listenTo(this.collection, "sync", this.render);
		this.listenTo(this.model, "sync", this.render);
	},
	
	events: {
		"click .close-button": "removeShopFromCart",
		"click .remove-listing-button": "removeListingFromCart"
	},
	
	removeShopFromCart: function(event) {
		event.preventDefault();
		$.ajax({
			url: 'api/cart/' + this.model.get('id'),
			type: "POST",
			data: {
				add: false,
				remove: "shop",
				shop_id: $(event.currentTarget).data('shop-id')
			},
			dataType: "json",
			success: function(data) {
				debugger
				this.parse(data);
			}.bind(this)
		});
	},
	
	removeListingFromCart: function(event) {
		event.preventDefault();
		$.ajax({
			url: 'api/cart/' + this.model.get('id'),
			type: "POST",
			data: {
				add: false,
				remove: "listing",
				listing_id: $(event.currentTarget).data('listing-id')
			},
			dataType: "json",
			success: function(data) {
				debugger
				var attrs = this.model.parse(data);
				this.model.set(attrs);
			}.bind(this)
		});
	},
	
	render: function() {
		var templateCode = this.template({ shops: this.collection });
		this.$el.html(templateCode);
		
		return this;
	}

});
