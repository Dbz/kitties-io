SpendYourSavings.Views.ShopFeatured = Backbone.View.extend({

  template: JST['shops/featured'],
	render: function() {
		var templateCode = this.template({ shop: this.model });
		this.$el.html(templateCode);
		return this;
	}

});
