function Till () {
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
    itemPrice = this.menu[item]
    itemQuantity = order.items[item];
    total += (itemPrice * itemQuantity);
  }
  return total;
};