describe ("Till", function(){

  var catalogue;
  var till;
  var quantityToChangeBy;

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
    quantityToChangeBy = 1;

  });

  describe("by default", function() {

    it("total quantity should be 0", function() {
      expect(till.totalQuantity).toEqual(0);
    });

    it("total price should be 0", function() {
      expect(till.totalPrice).toEqual(0);
    });

  });

  describe("products", function() {

    it("can add a product", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Flat White", quantityToChangeBy);
      expect(till.totalQuantity).toEqual(2);
    });

    it("can remove a product", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Flat White", quantityToChangeBy);
      till.removeProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalQuantity).toEqual(1);
    });

    it("cannot be negative", function() {
      till.removeProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalQuantity).toEqual(0);
    });

  });

  describe("prices", function() {

    it("can add the price of the added product", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalPrice).toEqual(4.75)
    });

  });

});
