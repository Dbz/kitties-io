SpendYourSavings.Views.ListingShopHeader = Backbone.View.extend({

  template: JST['listings/shop_header'],
	
	render: function() {
		var templateCode = this.template({ shop: this.model });
		this.$el.html(templateCode);
		return this;
	}
	

});
