Kitties.Models.Cart = Backbone.Model.extend({
	urlRoot: "api/cart",
	initialize: function(options) {
		this.user_id = options.user_id;
	}

});
