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
		
		this.addHeader();
		
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
	
	showShop: function(id) {
		var shop = new Kitties.Models.Shop({ id: id });
		shop.fetch();
		var shopView = new Kitties.Views.ShopShow({ model: shop });
		this._swapView(shopView);
	},
	
	shopSearch: function(id, queryData) {
		var shop = new Kitties.Models.Shop({ id: id });
		shop.fetch();
		var shopView = new Kitties.Views.ShopShow({ model: shop });
		
		queryData = decodeURIComponent(queryData);
		shop.listings().fetch({ data: { text: encodeURIComponent(queryData), shop_id: id } });
		this._swapView(shopView);
		
	},
	
	searchResults: function(queryData) {
		queryData = decodeURIComponent(queryData);
		var listings = new Kitties.Collections.Listings();
		listings.fetch({ data: {text: encodeURIComponent(queryData)} });
		$("#search").val(queryData);
			
		var searchView = new Kitties.Views.ListingsSearchShow({ 
			collection: listings 
		});
		this._swapView(searchView);
	},
	
	showCart: function() {
		Kitties.cart.fetch();
		var cartView = new Kitties.Views.CartShow({ collection: Kitties.cart.shops(), model: Kitties.cart });
		this._swapView(cartView);
	},
	
	addHeader: function() {
		var headerView = new Kitties.Views.Header({ cart: Kitties.cart });
		$('header').html(headerView.render().$el);
	}
	
	_swapView: function(view) {
		if(this._currentView)
			this._currentView.remove();
		this._currentView = view;
		this.$rootEl.html(view.render().$el);
	}
});
