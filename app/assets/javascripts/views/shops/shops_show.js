Kitties.Views.ShopShow = Backbone.View.extend({

  template: JST['shops/show'],
	className: "white",
	
	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
	},
	
	render: function() {
		var templateCode = this.template({ shop: this.model });
		this.$el.html(templateCode);
		
		return this;
	}

});
