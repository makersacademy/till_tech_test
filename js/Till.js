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

Till.prototype.produceReceipt = function(order) {
  var total = 0;
  var itemList = {};
  for(var item in order.items) {
    itemPrice = this.menu[item]
    itemQuantity = order.items[item];
    total += this.calculateItemTotal(itemPrice, itemQuantity);
    this.compileItemList(itemList, item, itemPrice, itemQuantity);
  }
  tax = this.calculateTax(total);
  return [itemList, total, tax];
};

Till.prototype.calculateItemTotal = function(itemPrice, itemQuantity) {
  return itemPrice * itemQuantity;
};

Till.prototype.compileItemList = function(itemList, item, itemPrice, itemQuantity) {
  itemList[item] = {'price': itemPrice, 'quantity': itemQuantity};
};

Till.prototype.calculateTax = function(total) {
  return parseFloat((total / 100 * 8.64).toFixed(2));
};