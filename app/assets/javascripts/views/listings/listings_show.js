SpendYourSavings.Views.ListingsShow = Backbone.CompositeView.extend({

  template: JST['listings/show'],
	
	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.reviews(), "add", this.addReview);
	},
	
	render: function() {
		if(this.model.images().length == 0)
			this.model.images().set(new SpendYourSavings.Collections.Images());
		var templateCode = this.template({ listing: this.model });
		this.$el.html(templateCode);
		
		this.attachSubviews();
		
		return this;
	},
	
	addReview: function(review) {
		var reviewView = new SpendYourSavings.Views.ReviewShow({ model: review });
		this.addSubview('#listing-reviews', reviewView);
	}

});
