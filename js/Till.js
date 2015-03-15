var Till = function() {
  this.totalQuantity = 0;
  this.defaultQuantityChange = 1;
};

Till.prototype.addProduct = function(quantityToChangeBy) {
  quantityToChangeBy = quantityToChangeBy || this.defaultQuantityChange;
  this.totalQuantity += quantityToChangeBy;
};