Kitties.Views.ShopShow = Backbone.CompositeView.extend({

  template: JST['shops/show'],
  className: "white",
  
  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.listings(), "sync", this.render)
  },
  
  events: {
    "submit #shop-search-form": "search"
  },
  
  search: function(event) {
    event.preventDefault();
    var queryString = $(event.currentTarget).find('#shop-search-box').val();
    if(queryString === "")
      Backbone.history.navigate("#/shops/" + this.model.get('id'), { trigger: true });
    else
      Backbone.history.navigate("#/shops/" + this.model.get('id') + "/search?q=" + encodeURIComponent(queryString), { trigger: true });
  },
  
  render: function() {
    var templateCode = this.template({ shop: this.model });
    this.$el.html(templateCode);
    
    return this;
  }

});
