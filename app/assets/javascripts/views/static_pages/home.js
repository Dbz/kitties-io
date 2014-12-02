Kitties.Views.StaticHome = Backbone.CompositeView.extend({

  template: JST['static_pages/home'],
	initialize: function(options) {
		// this.listenTo(this.model, "sync", this.render);
		this.listenTo(this.collection, "add", this.addShop);
	},
	
	render: function() {
		var templateCode = this.template({});
		this.$el.html(templateCode);
		
		this.attachSubviews();
		
		return this;
	},
	
	addShop: function(shop) {
		var shopView = new Kitties.Views.ShopFeatured({ model: shop });
		this.addSubview('#featured-shops', shopView);
	}

});
