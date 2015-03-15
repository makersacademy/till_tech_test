describe("Payment", function() {

  var catalogue;
  var till;
  var payment;

  beforeEach(function() {
    catalogue =
      [
        {
          "shopName": "The Coffee Connection",
          "address": "123 Lakeside Way",
          "phone": "16503600708",
          "prices": [
            {
              "Cafe Latte": 4.75,
              "Flat White": 4.75,
              "Cappucino": 3.85,
            }
          ]
        }
      ];
    till = new Till(catalogue);
    payment = new Payment(till);
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

    it("cannot be below the total price after tax", function() {
      payment.till.totalPriceBeforeDiscountAndTax = 100;
      expect(payment.addAmount(5)).toBe("Cannot be below the total price");
      expect(payment.total).toEqual(0);
    });
    
  });

});