window.SpendYourSavings = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
		new SpendYourSavings.Routers.Router({ $rootEl: $('#main-content') });
		Backbone.history.start();
  }
};

$(document).ready(function(){
  SpendYourSavings.initialize();
	
	// For modal buttons to open appropriate tab
	$('.login').click(function (e) {
	   $("a[href='#" + e.currentTarget.id + "-tab']").tab('show')
	});
	
});
