describe("Till", function () {
  var till;

  beforeEach(function () {
    till = new Till();
  });


  it("creates total using pricelist", function () {
    till.add("Cafe Latte");
    expect(till.getTotal()).toEqual('4.75');
  });

  it("adds items to currentOrder list with quantity", function () {
    till.add("Cafe Latte");
    till.add("Cafe Latte");
    expect(till.currentOrder).toEqual({"Cafe Latte": 2});
  });

  it("totals multiple items", function () {
    till.add("Cafe Latte");
    till.add("Blueberry Muffin");
    expect(till.getTotal()).toEqual('8.80');
  });

  it("calculates correct amount of tax", function () {
    till.add("Cafe Latte");
    expect(till.getTax()).toEqual('0.41');
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
    till.add("Blueberry Muffin");
    till.muffinDiscount();
    expect(till.getTotal()).toEqual('3.64');
  });

  it("has an option to turn on muffin discount", function() {
    expect(till.applyMuffinDiscount).toEqual(false);
    till.muffinDiscount();
    expect(till.applyMuffinDiscount).toEqual(true);
  });

  it("is able to give 5% discount on orders over 50", function () {
    till.add("Affogato");
    till.add("Affogato");
    till.add("Affogato");
    till.add("Affogato");
    till.over50Discount();
    expect(till.getTotal()).toEqual('56.24');
  });

  it("has an option to turn on over 50 discount", function() {
    expect(till.applyOver50Discount).toEqual(false);
    till.over50Discount();
    expect(till.applyOver50Discount).toEqual(true);
  });

});