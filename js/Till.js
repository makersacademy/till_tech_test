var Till = function() {
  this.totalQuantity = 0;
  this.minimumQuantity = 0;
  this.defaultQuantityChange = 1;
};

Till.prototype.addProduct = function(quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;
  this.totalQuantity += quantityToChangeBy;
};

Till.prototype.removeProduct = function(quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;

  if (this.totalQuantity - quantityToChangeBy < this.minimumQuantity) {
    this.totalQuantity = this.minimumQuantity;
  }
  else {
    this.totalQuantity -= quantityToChangeBy;
  }
};