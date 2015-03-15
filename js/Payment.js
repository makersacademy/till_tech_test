var Payment = function(till) {
  this.till = till;
  this.total = 0;
};

Payment.prototype.addAmount = function(amountToChangeBy) {
  
  if(amountToChangeBy < this.till.totalPriceAfterTax()){
    this.total = 0;
    return "Cannot be below the total price"
  }
  else {
    this.total += amountToChangeBy;
  }
};