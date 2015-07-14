function Till () {
}

Till.prototype.loadDetails = function() {
  var self = this;
  return $.getJSON('../hipstercoffee.json')
  .done(function(data) {
    self.menu = data[0]['prices'][0];
    self.shopName = data[0]['shopName'];
    self.address = data[0]['address'];
    self.phone = data[0]['phone'];
  });
};