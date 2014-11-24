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
});
