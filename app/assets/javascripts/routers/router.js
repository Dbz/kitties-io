SpendYourSavings.Routers.Router = Backbone.Router.extend({
	routes: {
		"": "index",
		"listings/:id": "showListing"
	},
	
	initialize: function(options) {
		this.$rootEl = options.$rootEl;
	},
	
	index: function() {
		;
	},
	
	showListing: function(id) {
		var listing = new SpendYourSavings.Models.Listing({ id: id });
		listing.fetch();
		var listingView = new SpendYourSavings.Views.ListingsShow({ model: listing });
		
		this._swapView(listingView);
	},
	
	_swapView: function(view) {
		if(this._currentView)
			this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(view.render().$el);
	}
});
