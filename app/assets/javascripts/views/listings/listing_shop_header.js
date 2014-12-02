Kitties.Views.ListingShopHeader = Backbone.View.extend({

  template: JST['listings/shop_header'],
	className: 'clearfix',
	
	initialize: function(options) {
		// this.listenTo(this.model.image(), "all", this.render);
	},
	
	render: function() {
		var templateCode = this.template({ shop: this.model });
		this.$el.html(templateCode);
		setTimeout( function() {
			this.$el.tooltip();
		}.bind(this), 1 );
		
		return this;
	}
	

});
