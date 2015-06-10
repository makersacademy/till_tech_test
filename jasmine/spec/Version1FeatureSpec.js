describe("Version 1", function () {
  var till;

  beforeEach(function () {
    till = new Till();
  });


  it("must calculate total amount", function () {
    till.add("Cafe Latte");
    expect(till.total).toEqual(4.75);
  });

});