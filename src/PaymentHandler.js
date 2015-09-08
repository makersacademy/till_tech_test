var PaymentHandler = function() {

};

PaymentHandler.prototype.calculateChange = function (cash, orderTotal) {
  return cash - orderTotal;
};
