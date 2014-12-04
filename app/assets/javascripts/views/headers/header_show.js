Kitties.Views.Header = Backbone.View.extend({

  template: JST['headers/show'],
	tagName: "nav",
	className: "nav margins",
	
	initialize: function(options) {
		this.listenTo(Kitties.cart, "all", this.render);
	},
	
	render: function() {
		var templateCode = this.template({ cart: Kitties.cart });
		this.$el.html(templateCode);
		return this;
	}

});
