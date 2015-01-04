Kitties.Models.Listing = Backbone.Model.extend({
  urlRoot: "api/listings/",
  images: function() {
    this._images = this._images || new Kitties.Collections.Images([], { listing: this });
    return this._images;
  },
  reviews: function() {
    this._reviews = this._reviews || new Kitties.Collections.Reviews([], { listing: this });
    return this._reviews;
  },
  shop: function() {
    this._shop = this._shop || new Kitties.Models.Shop({}, { listing: this });
    return this._shop;
    //return this.get('shop') || new Kitties.Models.Shop([], { listing: this });
  },
  tags: function() {
    this._tags = this._tags || new Kitties.Collections.Tags([], {});
    return this._tags;
  },
  
  
  parse: function(data) {
    if(data.images) {
      this.images().set(data.images, { parse: true });
      delete data.images;
    }
    if(data.reviews) {
      this.reviews().set(data.reviews, { parse: true });
      delete data.reviews;
    }
    if(data.shop) {
      var shopParams = this.shop().parse(data.shop);
      this.shop().set(shopParams);
      delete data.shop;
    }
    if(data.tags) {
      this.tags().set(data.tags, { parse: true });
      delete data.tags;
    }
    return data;
  },
  
  mainImage: function() {
    var main;
    this.images().each(function(image) {
      if(image.get('main_img'))
        main = image;
    });
    return main || new Kitties.Models.Image();
  }
});
