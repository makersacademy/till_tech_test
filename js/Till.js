var Till = function(catalogue) {
  this.catalogue = catalogue;
  
  this.totalQuantity = 0;
  this.minimumQuantity = 0;
  this.defaultQuantityChange = 1;

  this.prices = catalogue[0]["prices"][0];
  this.totalPriceBeforeDiscountAndTax = 0;

  this.defaultDiscount = 0;
  this.discount = 0.05; // 5%
  this.minimumPriceDiscount = 50;

  this.tax = 0.0864; //8.64%
};

Till.prototype.addProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;
  this.totalQuantity += quantityToChangeBy;
  pcost = this.productCost(productName, quantityToChangeBy)
  this.totalPriceBeforeDiscountAndTax += pcost;
};

Till.prototype.removeProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;

  if (this.totalQuantity - quantityToChangeBy < this.minimumQuantity) {
    this.totalQuantity = this.minimumQuantity;
  }
  else {
    this.totalQuantity -= quantityToChangeBy;
    pcost = this.productCost(productName, quantityToChangeBy)
    this.totalPriceBeforeDiscountAndTax -= pcost;
  }
};

Till.prototype.productCost = function(productName, quantityToChangeBy) {
  return this.prices[productName] * quantityToChangeBy;
};

Till.prototype.totalDiscount = function() {
  if(this.totalPriceBeforeDiscountAndTax > this.minimumPriceDiscount) {
    return this.totalPriceBeforeDiscountAndTax * this.discount;
  }
  else {
    return this.defaultDiscount;
  }
};

Till.prototype.totalPriceBeforeTax = function() {
  return this.totalPriceBeforeDiscountAndTax - this.totalDiscount();
};

Till.prototype.totalTax = function() {
  return parseFloat((this.totalPriceBeforeTax() * this.tax).toFixed(2));
};

Till.prototype.totalPriceAfterTax = function() {
  return parseFloat((this.totalPriceBeforeDiscountAndTax + this.totalTax()).toFixed(2));
};