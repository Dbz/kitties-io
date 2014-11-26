SpendYourSavings.Collections.Reviews = Backbone.Collection.extend({
  model: SpendYourSavings.Models.Review,
	
	initialize: function(models, options) {
		this.listing = options.listing;
	},
	
	_prepareModel: function(attrs, options) {
		var model = Backbone.Collection.prototype._prepareModel.call(this, attrs, options);
		model.shop = this.listing.shop();
		return model;
	}

});
