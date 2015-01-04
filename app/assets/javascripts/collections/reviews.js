Kitties.Collections.Reviews = Backbone.Collection.extend({
  model: Kitties.Models.Review,
  
  initialize: function(models, options) {
    this.listing = options.listing;
  },
  
  _prepareModel: function(attrs, options) {
    var model = Backbone.Collection.prototype._prepareModel.call(this, attrs, options);
    // model.shop = this.listing.shop();
    model.listing = this.listing
    return model;
  },
  
  averageReview: function() {
    var stars = 0;
    this.each(function(review) {
      stars += review.get('stars');
    });
    return Math.ceil(stars/this.length);
  }
  

});
