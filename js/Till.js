var Till = function(catalogue) {
  this.catalogue = catalogue;
  
  this.totalQuantity = 0;
  this.minimumQuantity = 0;
  this.defaultQuantityChange = 1;

  this.prices = catalogue[0]["prices"][0];
  this.totalPriceBeforeTax = 0;
  this.totalPriceAfterTax = 0;

  this.tax = 0.0864;
  this.totalTax = 0;
};

Till.prototype.addProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;
  this.totalQuantity += quantityToChangeBy;
  productCost = this.prices[productName] * quantityToChangeBy;
  this.totalPriceBeforeTax += productCost;
  this.totalTax += parseFloat((productCost * this.tax).toFixed(2));
  this.totalPriceAfterTax = (this.totalPriceBeforeTax + this.totalTax)
};

Till.prototype.removeProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;

  if (this.totalQuantity - quantityToChangeBy < this.minimumQuantity) {
    this.totalQuantity = this.minimumQuantity;
  }
  else {
    this.totalQuantity -= quantityToChangeBy;
    productCost = this.prices[productName] * quantityToChangeBy;
    this.totalPriceBeforeTax -= productCost;
    this.totalTax -= parseFloat((productCost * this.tax).toFixed(2));
    this.totalPriceAfterTax = (this.totalPriceBeforeTax + this.totalTax)
  }
};