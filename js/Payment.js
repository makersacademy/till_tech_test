var Payment = function() {
  this.total = 0;
};

Payment.prototype.addAmount = function(amountToChangeBy) {
  this.total += amountToChangeBy;
};