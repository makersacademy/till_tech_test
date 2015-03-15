describe ("Till", function(){

  var catalogue;
  var till;
  var quantityToChangeBy;
  var tax;

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
    tax = 0.0864;

  });

  describe("by default", function() {

    it("total quantity should be 0", function() {
      expect(till.totalQuantity).toEqual(0);
    });

    it("total price before taxes should be 0", function() {
      expect(till.totalPriceBeforeTax).toEqual(0);
    });

    it("total tax should be 0", function() {
      expect(till.totalTax).toEqual(0);
    });

    it("total price before taxes should be 0", function() {
      expect(till.totalPriceAfterTax).toEqual(0);
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

  describe("prices before tax", function() {

    it("can add the price of the added product", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalPriceBeforeTax).toEqual(4.75)
    });

    it("can sum more than one price", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Cappucino", quantityToChangeBy);
      expect(till.totalPriceBeforeTax).toEqual(8.6)
    });

    it("can remove the price of a removed product", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Cappucino", quantityToChangeBy);
      till.removeProduct("Cappucino", quantityToChangeBy);
      expect(till.totalPriceBeforeTax).toEqual(4.75)
    });

    it("cannot be negative", function() {
      till.removeProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalPriceBeforeTax).toEqual(0);
    });

  });

  describe("tax", function() {

    it("can add tax for the added product", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalTax).toEqual(0.41);
    });

    it("can sum more than one tax", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Cappucino", quantityToChangeBy);
      expect(till.totalTax).toEqual(0.74);
    });

    it("can reduce the tax if a product is removed", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Cappucino", quantityToChangeBy);
      till.removeProduct("Cappucino", quantityToChangeBy);
      expect(till.totalTax).toEqual(0.41)
    });

  });

  describe("prices after tax", function() {

    it("can add the tax to the price after tax", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalPriceAfterTax).toEqual(5.16)
    });

    it("can sum more than one price", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Cappucino", quantityToChangeBy);
      expect(till.totalPriceAfterTax).toEqual(9.34)
    });

    it("can remove the price of a removed product", function() {
      till.addProduct("Cafe Latte", quantityToChangeBy);
      till.addProduct("Cappucino", quantityToChangeBy);
      till.removeProduct("Cappucino", quantityToChangeBy);
      expect(till.totalPriceAfterTax).toEqual(5.16)
    });

    it("cannot be negative", function() {
      till.removeProduct("Cafe Latte", quantityToChangeBy);
      expect(till.totalPriceAfterTax).toEqual(0);
    });

  });

});
