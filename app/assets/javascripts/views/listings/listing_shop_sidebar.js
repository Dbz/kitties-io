Kitties.Views.ListingShopSidebar = Backbone.View.extend({

  template: JST['listings/shop_sidebar'],
	
	render: function() {
		var templateCode = this.template({ shop: this.model });
		this.$el.html(templateCode);
		return this;
	}

});
