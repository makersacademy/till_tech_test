describe("Version 1", function () {
  var till;

  beforeEach(function () {
    till = new Till();
  });


  it("must calculate total amount", function () {
    till.add("Cafe Latte");
    till.add("Cafe Latte");
    till.add("Blueberry Muffin");
    till.add("Choc Mudcake");
    expect(till.getTotal()).toEqual('19.95');
  });

  it("must calculate tax correctly", function () {
    till.add("Cafe Latte");
    till.add("Cafe Latte");
    till.add("Blueberry Muffin");
    till.add("Choc Mudcake");
    expect(till.getTax()).toEqual('1.72');
  });

  it("must display line totals correctly", function () {
    till.add("Cafe Latte");
    till.add("Cafe Latte");
    till.add("Blueberry Muffin");
    till.add("Choc Mudcake");
    expect(till.getLineTotals()).toMatch('Cafe Latte 2 x 4.75\nBlueberry Muffin 1 x 4.05\nChoc Mudcake 1 x 6.40\n');
  });

  it("must be able to take payment and calculate change correctly", function () {
    till.add("Cafe Latte");
    till.add("Cafe Latte");
    till.add("Blueberry Muffin");
    till.add("Choc Mudcake");
    expect(till.pay(20.00)).toEqual('0.05');
  });

  it("is able to give 10% discount on muffins", function () {
    till.add("Cafe Latte");
    till.add("Cafe Latte");
    till.add("Blueberry Muffin");
    till.add("Choc Mudcake");
    till.muffinDiscount();
    expect(till.getTotal()).toEqual('19.55');
  });

});