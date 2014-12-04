Kitties.Views.ListingsShow = Backbone.CompositeView.extend({

  template: JST['listings/show'],
	
	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.reviews(), "add", this.addReview);
		this.listenTo(this.model.shop(), "change reset", this.addShopHeader);
		this.listenTo(this.model.shop(), "change reset", this.addShopSidebar);
	},
	
	events: {
		"submit #add-to-cart": "addToCart"
	},
	
	addToCart: function(event) {
		event.preventDefault();
		var order = new Kitties.Models.Order({ listing_id: this.model.get('id') });
		order.save();
		Kitties.cart.shops().getOrFetch(this.model.shop().get('id')).orders().add(order);
		Kitties.cart.set('amount', Kitties.cart.get('amount') + 1);
		Kitties.cart.trigger("sync");
	},
	
	render: function() {
		if(this.model.images().length == 0)
			this.model.images().set(new Kitties.Collections.Images());
		
		var templateCode = this.template({ listing: this.model });
		this.$el.html(templateCode);
		
		this.attachSubviews();
		
		return this;
	},
	
	addReview: function(review) {
		var reviewView = new Kitties.Views.ReviewShow({ model: review });
		this.addSubview('#listing-reviews', reviewView);
	},
	
	addShopHeader: function(shop) {
		var headerView = new Kitties.Views.ListingShopHeader({ model: shop });
		this.addSubview('#listing-shop-header', headerView);
	},
	
	addShopSidebar: function(shop) {
		var sidebarView = new Kitties.Views.ListingShopSidebar({ model: shop });
		this.addSubview('#listing-shop-sidebar', sidebarView);
	}

});
