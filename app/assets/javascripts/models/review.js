Kitties.Models.Review = Backbone.Model.extend({
  initialize: function(options) {
    this.listing = options.listing
  },
  user: function() {
    this._user = this._user || new Kitties.Models.User();
    return this._user;
  },
  userImage: function() {
    if(this.user().get('url'))
      return this.user().get('url');
    return "https://www.etsy.com/images/avatars/default_avatar_75px.png";
  },
  date: function() {
    var args = this.get('updated_at').substring(0, this.get('updated_at').indexOf("T")).split('-');
    args[1] -= 1; // Change month to 0 index
    var d = this.applyToConstructor(Date, args);
    return d.toDateString();
  },
  applyToConstructor: function(constructor, argArray) { 
      var args = [null].concat(argArray);
      var factoryFunction = constructor.bind.apply(constructor, args);
      return new factoryFunction();
  },
  parse: function(data) {
    if(data.user) {
      this.user().set(data.user);
      delete data.user;
    }
    return data;
  }
});
