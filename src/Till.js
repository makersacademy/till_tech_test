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
