window.Kitties = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		new Kitties.Routers.Router({ $rootEl: $('#main-content') });
		Backbone.history.start();
  }
};

$(document).ready(function(){
  Kitties.initialize();
	
	Kitties.user = Kitties.user || new Kitties.Models.User();
	Kitties.user.fetch();
	
	var headerView = new Kitties.Views.Header({});
	$('header').html(headerView.render().$el);
	
});