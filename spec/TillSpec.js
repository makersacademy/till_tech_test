describe ("Till", function(){

  var till;

  beforeEach(function() {
    till = new Till();
  });

  describe("by default", function() {

    it("total should be 0", function() {
      expect(till.total).toEqual(0);
    });

  });

});
