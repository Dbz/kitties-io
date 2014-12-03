Kitties.Views.ShopShow = Backbone.CompositeView.extend({

  template: JST['shops/show'],
	className: "white",
	
	initialize: function(options) {
		this.listenTo(this.model, "sync", this.render);
		console.log(this.collection)
		// if(this.collection)
		// 	this.model._listings = this.collection;
	},
	
	events: {
		"submit #shop-search-form": "search"
	},
	
	search: function(event) {
		event.preventDefault();
		var queryString = $(event.currentTarget).find('#shop-search-box').val();
		console.log(queryString);
		Backbone.history.navigate("#/shops/" + this.model.get('id') + "/search?q=" + encodeURIComponent(queryString), { trigger: true });
	},
	
	render: function() {
		var templateCode = this.template({ shop: this.model });
		this.$el.html(templateCode);
		
		return this;
	}

});
