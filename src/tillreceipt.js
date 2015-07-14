function TillReceipt() {

  var orderItemsWithPrices;
  var order;
  var nameOfShop;
  this.order = [];
  this.orderItemsWithPrices = {};

  this.items = {'Cafe Latte': 4.75};

  TillReceipt.prototype.nameOfCoffeeShop = function(coffeeShopName) {
    this.nameOfShop = coffeeShopName;
    return nameOfShop;
  };

  TillReceipt.prototype.addToOrder = function(itemName) {
    this.order.push(itemName);
    return order;
  };

};
