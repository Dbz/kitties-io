Kitties.Views.Header = Backbone.View.extend({

  template: JST['headers/show'],
	tagName: "nav",
	className: "nav margins",
	
	initialize: function(options) {
		this.listenTo(Kitties.cart, "sync", this.render);		
		this.listenTo(Kitties.user, "sync", this.render);
		this.listenTo(Kitties.cart, 'addOrder', this.addOrder);
	},
	
	events: {
		"submit #search-wrapper": "search",
		"click #cart": "cart",
		"click .login": "openModal",
		"click #logout": "logout"
	},
	
	addOrder: function (order) {
		debugger
		
	},
	
	logout: function(event) {
		$.ajax({
			url: "api/sessions." + Kitties.user.get('id'),
			type: "delete",
			success: function() {
				window.location.reload();
			}
		});
		// Kitties.user.fetch();
	},
	
	openModal: function(event) {
		$("a[href='#" + event.currentTarget.id + "-tab']").tab('show');
	},
	
	search: function(event) {
		event.preventDefault();
		var queryString = $(event.currentTarget).find('#search').val();
		if(queryString === "")
			Backbone.history.navigate("#", { trigger: true });
		else
			Backbone.history.navigate("#/search?q=" + encodeURIComponent(queryString), { trigger: true });
	},
	
	cart: function() {
		Backbone.history.navigate('#/cart', { trigger: true });
	},
	
	render: function() {
		console.log("rendering Header")
		var templateCode = this.template({});
		this.$el.html(templateCode);
		return this;
	}

});
