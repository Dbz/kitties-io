SpendYourSavings.Views.ReviewShow = Backbone.View.extend({

  template: JST['reviews/show'],
	className: 'review-container',
	
	render: function() {
		var templateCode = this.template({ review: this.model });
		this.$el.html(templateCode);
		return this;
	}

});
