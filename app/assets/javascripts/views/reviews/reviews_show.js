Kitties.Views.ReviewShow = Backbone.View.extend({

  template: JST['reviews/show'],
	// className: 'review-container',
	className: 'review-container clearfix',
	
	render: function() {
		var templateCode = this.template({ review: this.model });
		this.$el.html(templateCode);
		return this;
	}

});
