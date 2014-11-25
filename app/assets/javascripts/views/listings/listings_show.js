SpendYourSavings.Views.ListingsShow = Backbone.View.extend({

  template: JST['listings/show'],
	
	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
	},
	
	render: function() {
		if(this.model.images().length == 0)
			this.model.images().set(new SpendYourSavings.Collections.Images());
		var templateCode = this.template({ listing: this.model });
		this.$el.html(templateCode);
		return this;
	}

});
