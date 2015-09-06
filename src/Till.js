var Till = function() {
  this.detailsList = hipsterCoffeeDetails;
};

Till.prototype.retrievePrice = function(item) {
  return this.detailsList[0].prices[0][item];
};
