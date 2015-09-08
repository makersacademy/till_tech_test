var PaymentHandler = function() {

};

PaymentHandler.prototype.calculateChange = function (cash, orderTotal) {
  if (cash < orderTotal) {
    return 'Not enough cash given';
  }
  else {
    return cash - orderTotal;
  }
};
