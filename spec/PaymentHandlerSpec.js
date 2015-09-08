describe('PaymentHandler', function() {
  var paymentHandler;

  describe('when no vouchers', function() {
    it('calculates correct change', function() {
      paymentHandler = new PaymentHandler();
      expect(paymentHandler.calculateChange(10.00, 5,00)).toEqual(5.00);
    });
  });
});
