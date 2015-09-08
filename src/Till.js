var Till = function() {
  this.detailsList = hipsterCoffeeDetails;
  this.subTotal = 0;
};

Till.prototype.retrievePrice = function(item) {
  return this.detailsList[0].prices[0][item];
};

Till.prototype.addItem = function (item) {
  this.subTotal += this.retrievePrice(item);
};

Till.prototype.calculateTotal = function () {
  return this.subTotal;
};

Till.prototype.calculateTax = function (total_bill) {
  tax = total_bill * 0.0864;
  return Math.round(tax * 100) / 100;
};
