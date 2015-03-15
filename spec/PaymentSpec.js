describe("Payment", function() {

  var payment;

  beforeEach(function() {
    payment = new Payment;
  });

  describe("by default", function() {

    it("should be 0", function() {
      expect(payment.total).toEqual(0);
    });

  });

  describe("add payment", function() {

    it("can add amount the client pays", function() {
      payment.addAmount(5);
      expect(payment.total).toEqual(5);
    });
    
  });

});