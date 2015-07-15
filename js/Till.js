function Till () {
  this.total = 0.00;
}

Till.prototype.loadDetails = function() {
  var self = this;
  return $.getJSON('../hipstercoffee.json')
  .done(function(data) {
    self.shopName = data[0]['shopName'];
    self.address = data[0]['address'];
    self.phone = data[0]['phone'];
    self.menu = data[0]['prices'][0];
  });
};

Till.prototype.displayTotal = function(order) {
  var total = 0;
  for(var item in order.items) {
    total += this.menu[item]
  }
  return total;
};