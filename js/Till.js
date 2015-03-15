var Till = function(catalogue) {
  this.catalogue = catalogue;
  
  this.totalQuantity = 0;
  this.minimumQuantity = 0;
  this.defaultQuantityChange = 1;

  this.prices = catalogue[0]["prices"][0];
  this.totalPrice = 0;
};

Till.prototype.addProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;
  this.totalQuantity += quantityToChangeBy;
  this.totalPrice += this.prices[productName] * quantityToChangeBy;
};

Till.prototype.removeProduct = function(productName, quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;

  if (this.totalQuantity - quantityToChangeBy < this.minimumQuantity) {
    this.totalQuantity = this.minimumQuantity;
  }
  else {
    this.totalQuantity -= quantityToChangeBy;
  }
};