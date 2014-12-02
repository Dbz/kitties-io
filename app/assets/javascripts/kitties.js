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
	
	// For modal buttons to open appropriate tab
	$('.login').click(function (e) {
		$("a[href='#" + e.currentTarget.id + "-tab']").tab('show');
	});
	
});