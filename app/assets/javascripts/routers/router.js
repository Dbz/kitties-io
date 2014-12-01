SpendYourSavings.Routers.Router = Backbone.Router.extend({
	routes: {
		"": "index",
		"listings/:id": "showListing",
		"search?q=:term": "searchResults"
	},
	
	initialize: function(options) {
		this.$rootEl = options.$rootEl;
		$('#search-wrapper').on('submit', function (event) {
			event.preventDefault();
			var queryString = $(event.currentTarget).find('#search').val();
			// this.searchResults("q=" + queryString)
			Backbone.history.navigate("#/search?q=" + encodeURIComponent(queryString), { trigger: true });
		}.bind(this));
	},
	
	index: function() {
		var shops = new SpendYourSavings.Collections.FeaturedShops();
		shops.fetch();
		
		var homeView = new SpendYourSavings.Views.StaticHome({collection: shops});
		this._swapView(homeView);
	},
	
	showListing: function(id) {
		var listing = new SpendYourSavings.Models.Listing({ id: id });
		listing.fetch();
		var listingView = new SpendYourSavings.Views.ListingsShow({ model: listing });
		
		this._swapView(listingView);
	},
	
	searchResults: function(queryData) {
		queryData = decodeURIComponent(queryData);
		var listings = new SpendYourSavings.Collections.SearchListings();
		listings.fetch({ data: {text: encodeURIComponent(queryData)} });
			
		var searchView = new SpendYourSavings.Views.ListingsSearchShow({ 
			collection: listings 
		});
		this._swapView(searchView);
	},
	
	_swapView: function(view) {
		if(this._currentView)
			this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(view.render().$el);
	}
});
