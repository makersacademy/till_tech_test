describe ("Till", function(){

  var till;
  var quantityToChangeBy;

  beforeEach(function() {
    till = new Till();
    quantityToChangeBy = 1;
  });

  describe("by default", function() {

    it("total should be 0", function() {
      expect(till.totalQuantity).toEqual(0);
    });

  });

  describe("products", function() {

    it("can add a product", function() {
      till.addProduct(quantityToChangeBy);
      expect(till.totalQuantity).toEqual(1);
    });

    it("can remove a product", function() {
      till.addProduct(quantityToChangeBy);
      till.removeProduct(quantityToChangeBy);
      expect(till.totalQuantity).toEqual(0);
    });

    it("cannot be negative", function() {
      till.removeProduct(quantityToChangeBy);
      expect(till.totalQuantity).toEqual(0);
    });

  });

});
