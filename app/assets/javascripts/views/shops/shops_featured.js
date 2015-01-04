Kitties.Views.ShopFeatured = Backbone.View.extend({

  template: JST['shops/featured'],
  className: 'col-md-4',
  render: function() {
    var products = this.model.listings().sample(3);
    var featuredProduct = products.pop();
    var templateCode = this.template({ 
      shop: this.model, 
      products: products, 
      featuredProduct: featuredProduct 
      }
    );
    this.$el.html(templateCode);
    return this;
  }

});
