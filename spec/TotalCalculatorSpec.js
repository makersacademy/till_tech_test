describe('TotalCalculator', function() {
  var totalCalculator;

  describe('calculates discounts', function() {
    it('5% off orders over £50', function() {
      totalCalculator = new TotalCalculator();
      totalCalculator.subTotal = 50.01;
      totalCalculator.orderedItems = [];
      totalCalculator.detailsList = hipsterCoffeeDetails;
      expect(totalCalculator.calculateTotalBill()).toEqual(47.51);
    });

    it('not 5% off orders of =< £50', function() {
      totalCalculator = new TotalCalculator();
      totalCalculator.subTotal = 50.00;
      totalCalculator.orderedItems = ['Tiramisu'];
      expect(totalCalculator.calculateTotalBill()).toEqual(50.00);
    });

    it('10% muffin discount', function() {
      totalCalculator = new TotalCalculator();
      totalCalculator.subTotal = 12.65;
      totalCalculator.orderedItems = ['Muffin Of The Day', 'Blueberry Muffin', 'Chocolate Chip Muffin'];
      expect(totalCalculator.calculateTotalBill()).toEqual(11.39);
    });
  });
})
