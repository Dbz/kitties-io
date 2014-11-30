SpendYourSavings.Views.ListingsShow = Backbone.CompositeView.extend({

  template: JST['listings/show'],
	
	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.model.reviews(), "add", this.addReview);
		this.listenTo(this.model.shop(), "change reset", this.addShopHeader);
		this.listenTo(this.model.shop(), "change reset", this.addShopSidebar);
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
	},
	
	addShopHeader: function(shop) {
		var headerView = new SpendYourSavings.Views.ListingShopHeader({ model: shop });
		this.addSubview('#listing-shop-header', headerView);
	},
	
	addShopSidebar: function(shop) {
		var sidebarView = new SpendYourSavings.Views.ListingShopSidebar({ model: shop });
		this.addSubview('#listing-shop-sidebar', sidebarView);
	}

});
