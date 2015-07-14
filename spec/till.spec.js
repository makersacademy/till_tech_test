describe('Till receipt', function() {

  var tillReceipt;

  beforeEach(function() {
    tillReceipt = new TillReceipt();
  });

  it('knows the coffee shop name', function() {
    tillReceipt.nameOfCoffeeShop("The Coffee Connection");
    expect(tillReceipt.nameOfShop).toEqual("The Coffee Connection");
  });

  it('starts off with no items on it', function() {
    expect(tillReceipt.order).toEqual([]);
  });

  it('shows the name of each individual item', function() {
    tillReceipt.addToOrder('Cafe Latte');
    expect(tillReceipt.order).toEqual(['Cafe Latte']);
  });

  // it('shows the price alongside each item', function() {
  //   tillReceipt.addToOrder('Cafe Latte');
  //   expect(tillReceipt.orderItemsWithPrices).toEqual({'Cafe Latte': 4.75});
  // });

  // it('will not let you add something that the coffee shop doesn\'t sell', function() {

  // });
});