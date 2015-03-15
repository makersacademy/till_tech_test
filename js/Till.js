var Till = function(catalogue) {
  this.catalogue = catalogue;
  
  this.totalQuantity = 0;
  this.minimumQuantity = 0;
  this.defaultQuantityChange = 1;

  this.prices = catalogue[0]["prices"][0];
  this.totalPriceBeforeTax = 0;

  this.tax = 0.0864;
  this.totalTax = 0;
};

Till.prototype.addProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;
  this.totalQuantity += quantityToChangeBy;
  pcost = this.productCost(productName, quantityToChangeBy)
  this.totalPriceBeforeTax += pcost;
  this.totalTax += parseFloat((pcost * this.tax).toFixed(2));
};

Till.prototype.removeProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;

  if (this.totalQuantity - quantityToChangeBy < this.minimumQuantity) {
    this.totalQuantity = this.minimumQuantity;
  }
  else {
    this.totalQuantity -= quantityToChangeBy;
    pcost = this.productCost(productName, quantityToChangeBy)
    this.totalPriceBeforeTax -= pcost;
    this.totalTax -= parseFloat((pcost * this.tax).toFixed(2));
  }
};

Till.prototype.totalPriceAfterTax = function() {
  return this.totalPriceBeforeTax + this.totalTax;
};

Till.prototype.productCost = function(productName, quantityToChangeBy) {
  return this.prices[productName] * quantityToChangeBy;
};