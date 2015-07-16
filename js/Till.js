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
  var muffinDiscount = this.calculateMuffinDiscount(order)[0];
  total -= muffinDiscount;
  total = this.priceFormat(total);
  return [itemList, total, tax];
};

Till.prototype.calculateItemTotal = function(itemPrice, itemQuantity) {
  return itemPrice * itemQuantity;
};

Till.prototype.compileItemList = function(itemList, item, itemPrice, itemQuantity) {
  itemList[item] = {'price': itemPrice, 'quantity': itemQuantity};
};

Till.prototype.calculateTax = function(total) {
  return this.priceFormat(total / 100 * 8.64);
};

Till.prototype.calculateChange = function(total, payment) {
  return this.priceFormat(payment - total);
};

Till.prototype.calculateMuffinDiscount = function(order) {
  var muffinTotal = 0;
  var muffinDiscount = 0;
  for(var item in order.items) {
    if(item.match(/Muffin/)) {
      itemPrice = this.menu[item];
      itemQuantity = order.items[item];
      itemTotal = this.calculateItemTotal(itemPrice, itemQuantity);
      muffinTotal += itemTotal;
      muffinDiscount += this.priceFormat(itemTotal / 10);
    }
  }
  muffinDiscount = this.priceFormat(muffinDiscount);
  muffinTotal = this.priceFormat(muffinTotal);
  return [muffinDiscount, muffinTotal];
};

Till.prototype.priceFormat = function(price) {
  return parseFloat(price.toFixed(2));
};
