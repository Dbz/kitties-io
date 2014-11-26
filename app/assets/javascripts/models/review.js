SpendYourSavings.Models.Review = Backbone.Model.extend({
	initialize: function(options) {
		this.listing = options.listing
	},
	userImage: function() {
		return "https://www.etsy.com/images/avatars/default_avatar_75px.png";
	},
	date: function() {
		var args = this.get('updated_at').substring(0, this.get('updated_at').indexOf("T")).split('-');
		var d = this.applyToConstructor(Date, args);
		return d.toDateString();
	},
	applyToConstructor: function(constructor, argArray) { 
	    var args = [null].concat(argArray);
	    var factoryFunction = constructor.bind.apply(constructor, args);
	    return new factoryFunction();
	}
});
