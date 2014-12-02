Kitties.Models.User = Backbone.Model.extend({
	urlRoot: "api/users/",
	image: function() {
		this._image = this._image || new Kitties.Models.Image();
		return this._image;
	},
	parse: function(data) {
		if(data.image) {
			this.image().set(data.image, { parse: true });
			delete data.image;
		}
		return data
	}
});