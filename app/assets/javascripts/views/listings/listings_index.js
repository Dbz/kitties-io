SpendYourSavings.Views.ListingsIndex = Backbone.View.extend({

  template: JST['listings/index'],
	
	render: function() {
		var templateCode = this.template({ listing: this.model });
		this.$el.html(templateCode);
		return this;
	}
	

});
