var Till = function() {
  this.detailsList = hipsterCoffeeDetails;
  this.orderedItems = [];
  this.subTotal = 0;
  this.totalCalculator = new TotalCalculator(this.detailsList, this.orderedItems, this.subTotal);
};

Till.prototype.retrievePrice = function(item) {
  return this.detailsList[0].prices[0][item];
};

Till.prototype.addItem = function(item) {
  this.subTotal += this.retrievePrice(item);
  this.orderedItems.push(item);
  return item;
};

Till.prototype.calculateSubTotal = function() {
  return this.subTotal;
};

Till.prototype.calculateTax = function(totalOrderValue) {
  var tax = totalOrderValue * 0.0864;
  return Math.round(tax * 100) / 100;
};

Till.prototype.printOrder = function() {
  var order = this.orderedItems.reduce(function(acc, curr) {
    if (typeof acc[curr] == 'undefined') {
      acc[curr] = 1;
    } else {
      acc[curr] += 1;
    }
    return acc;
  }, {});
  return order;
};

Till.prototype.calculateChange = function (cash, billTotal) {
  if (cash < billTotal) {
    return 'Not enough cash given';
  }
  else {
    return cash - billTotal;
  }
};

Till.prototype.requestTotal = function () {
  return this.totalCalculator.calculateTotalBill();
};
