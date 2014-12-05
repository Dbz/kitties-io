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
	
	Kitties.user = Kitties.user || new Kitties.Models.User();
	Kitties.user.fetch();
	
	Kitties.cart = new Kitties.Models.Cart({ user: Kitties.user });
	Kitties.cart.fetch();
	
  Kitties.initialize();
	
	$('#auth-modal').on('hide.bs.modal', function(event) {
		$('#main-content').removeClass('blur');
		$('header').removeClass('blur');
	});
	
	$('#auth-modal').on('show.bs.modal', function(event) {
		$('#main-content').addClass('blur');
		$('header').addClass('blur');
	});
});