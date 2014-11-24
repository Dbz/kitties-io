SpendYourSavings.Views.ListingsShow = Backbone.View.extend({

  template: JST['listings/show'],
	
	initialize: function(options) {
		// this.name = options.name;
		// this.price = options.price;
		// this.available = options.available;
		// this.reviews = options.reviews;
		// this.shop_id = options.shop_id;
		// this.description = options.description;
		// this.policies = options.policies;
		this.listenTo(this.model, "sync", this.render);
	},
	
	render: function() {
		this.model.set('images', []);	
		var templateCode = this.template({ listing: this.model });
		this.$el.html(templateCode);
		return this;
	}

});
