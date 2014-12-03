Kitties.Routers.Router = Backbone.Router.extend({
	routes: {
		"": "index",
		"listings/:id": "showListing",
		"shops/:id": "showShop",
		"shops/:id/search?q=:term": "shopSearch",
		"search?q=:term": "searchResults",
		"cart": "showCart"
	},
	
	initialize: function(options) {
		this.$rootEl = options.$rootEl;
		
		$('#search-wrapper').on('submit', function (event) {
			event.preventDefault();
			var queryString = $(event.currentTarget).find('#search').val();
			Backbone.history.navigate("#/search?q=" + encodeURIComponent(queryString), { trigger: true });
		}.bind(this));
		
		$("#cart").on('click', function(event) {
			Backbone.history.navigate('#/cart', { trigger: true });
		});
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
	
	showShop: function(id, listings) {
		var shop = new Kitties.Models.Shop({ id: id });
		shop.fetch();
		var shopView = new Kitties.Views.ShopShow({ model: shop, collection: listings });
		this._swapView(shopView);
	},
	
	shopSearch: function(id, queryData) {
		queryData = decodeURIComponent(queryData);
		var listings = new Kitties.Collections.SearchShopListings({ shop_id: id });
		listings.fetch({ data: {text: encodeURIComponent(queryData)} });
		
		this.showShop(id, listings);
	},
	
	searchResults: function(queryData) {
		queryData = decodeURIComponent(queryData);
		var listings = new Kitties.Collections.SearchListings();
		listings.fetch({ data: {text: encodeURIComponent(queryData)} });
		$("#search").val(queryData);
			
		var searchView = new Kitties.Views.ListingsSearchShow({ 
			collection: listings 
		});
		this._swapView(searchView);
	},
	
	showCart: function() {
		var cart = new Kitties.Models.Cart({ user_id: Kitties.user_id });
		cart.fetch();
		
		var cartView = new Kitties.Views.CartShow({ collection: cart.shops(), model: cart });
		this._swapView(cartView);
	},
	
	_swapView: function(view) {
		if(this._currentView)
			this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(view.render().$el);
	}
});
