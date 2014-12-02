Kitties.Routers.Router = Backbone.Router.extend({
	routes: {
		"": "index",
		"listings/:id": "showListing",
		"shops/:id": "showShop",
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
		var shops = new Kitties.Collections.FeaturedShops();
		shops.fetch();
		
		var homeView = new Kitties.Views.StaticHome({collection: shops});
		this._swapView(homeView);
	},
	
	showListing: function(id) {
		var listing = new Kitties.Models.Listing({ id: id });
		listing.fetch();
		var listingView = new Kitties.Views.ListingsShow({ model: listing });
		
		this._swapView(listingView);
	},
	
	showShop: function(id) {
		var shop = new Kitties.Models.Shop({ id: id });
		shop.fetch();
		var shopView = new Kitties.Views.ShopShow({ model: shop });
		this._swapView(shopView);
	},
	
	searchResults: function(queryData) {
		queryData = decodeURIComponent(queryData);
		var listings = new Kitties.Collections.SearchListings();
		listings.fetch({ data: {text: encodeURIComponent(queryData)} });
			
		var searchView = new Kitties.Views.ListingsSearchShow({ 
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
