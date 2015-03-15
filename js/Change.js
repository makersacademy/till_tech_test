var Change = function(till, payment) {
  this.till = till;
  this.payment = payment;
  this.total = 0;
};

Change.prototype.calculateChange = function() {
  this.total += (this.payment.total - this.till.totalPriceBeforeTax());
};