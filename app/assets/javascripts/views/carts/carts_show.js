Kitties.Views.CartShow = Backbone.View.extend({

  template: JST['carts/show'],
	
	initialize: function(optioins) {
		this.listenTo(this.collection, "sync", this.render);
	},
	
	render: function() {
		var templateCode = this.template({ orders: this.collection });
		this.$el.html(templateCode);
		
		return this;
	}

});
