Kitties.Views.CartShow = Backbone.View.extend({

  template: JST['carts/show'],
	
	initialize: function(optioins) {
		this.listenTo(this.collection, "sync", this.render);
		this.listenTo(this.model, "sync", this.render);
		// $('.panel-heading #close').on('click', function(event) {
// 			event.preventDefault();
// 			// TODO: remove items from cart
// 		})
	},
	
	events: {
		"click .close-button": "removeFromCart"
	},
	
	removeFromCart: function(event) {
		console.log("hello")
		event.preventDefault();
		$.ajax({
			url: 'api/cart/' + this.model.get('id'),
			type: "POST",
			data: {
				add: false,
				remove: "shop",
				shop_id: $(event.currentTarget).data('shop-id')
			},
			dataType: "json"
			// success: Bacj
		});
	},
	
	render: function() {
		var templateCode = this.template({ shops: this.collection });
		this.$el.html(templateCode);
		
		return this;
	}

});
