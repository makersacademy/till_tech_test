describe("Change", function() {

  var change;

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
    change = new Change(till, payment);
  });

  describe("by default", function() {

    it("should be 0", function() {
      expect(change.total).toEqual(0);
    });

  });

  describe("calculate change", function() {

    it("based on total price and payment", function() {
      change.till.totalPriceBeforeDiscountAndTax = 80;
      change.payment.total = 100;
      change.calculateChange();
      expect(change.total).toEqual(24);
    });

  });

});