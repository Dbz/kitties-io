SpendYourSavings.Views.ShopShow = Backbone.View.extend({

  template: JST['shops/show'],
	
	initialize: function(options) {
		this.listenTo(this.model.listings(), "add", this.render);
	},
	
	render: function() {
		var templateCode = this.template({ shop: this.model });
		this.$el.html(templateCode);
		
		return this;
	}

});
