Kitties.Views.ListingsSearchShow = Backbone.CompositeView.extend({

  template: JST['listings/search'],
  
  initialize: function(options) {
    this.listenTo(this.collection, "add", this.render);
  },
  
  render: function() {
    var templateCode = this.template({ listings: this.collection });
    this.$el.html(templateCode);
    
    return this;
  }
  
})