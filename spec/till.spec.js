describe('Till receipt', function() {

  var tillReceipt;

  beforeEach(function() {
    tillReceipt = new TillReceipt();
  });

  TillReceipt.prototype.OrderCafeLatteFlatWhiteConfirm = function() {
    tillReceipt.addToOrder('Cafe Latte');
    tillReceipt.addToOrder('Flat White');
    tillReceipt.confirmOrder();
  };

  it('knows the coffee shop name', function() {
    tillReceipt.nameOfCoffeeShop("The Coffee Connection");
    expect(tillReceipt.nameOfShop).toEqual("The Coffee Connection");
  });

  it('starts off with no items on it', function() {
    expect(tillReceipt.orderItemsWithPrices).toEqual([]);
  });

  it('shows the name of each individual item', function() {
    tillReceipt.addToOrder('Cafe Latte');
    expect(tillReceipt.orderItemsWithPrices[0]).toEqual({'Cafe Latte': 4.75 });
  });

  it('shows the price alongside each item', function() {
    tillReceipt.addToOrder('Cafe Latte');
    expect(tillReceipt.orderItemsWithPrices).toEqual([{'Cafe Latte': 4.75 }]);
  });

  it('will not let you add something that the coffee shop doesn\'t sell', function() {
    tillReceipt.addToOrder('Definitely not on the menu...');
    expect(tillReceipt.orderItemsWithPrices).toEqual([]);
  });

  it('lets you add different items to order', function() {
    tillReceipt.addToOrder('Cafe Latte');
    tillReceipt.addToOrder('Flat White');
    expect(tillReceipt.orderItemsWithPrices).toEqual([{'Cafe Latte': 4.75 },{'Flat White': 4.75 }]);
  });

  it('adds up the total of each item on the order before tax', function() {
    tillReceipt.OrderCafeLatteFlatWhiteConfirm();
    expect(tillReceipt.confirmedPreTaxOrderTotal).toEqual(9.50);
  });

  it('calculates 8.64% tax to 2dp and adds that to the total', function() {
    tillReceipt.OrderCafeLatteFlatWhiteConfirm();
    expect(tillReceipt.calculatedTax).toEqual(0.82);
    expect(tillReceipt.confirmedPostTaxOrderTotal).toEqual(10.32);
  });

  it('records how much the customer has paid and calculates the change due back to the customer', function() {
    tillReceipt.OrderCafeLatteFlatWhiteConfirm();
    tillReceipt.customerPayment(20.00);
    expect(tillReceipt.changeDueToCustomer).toEqual(9.68);
  });

  it('throws an error if the customer has underpaid', function() {
    tillReceipt.OrderCafeLatteFlatWhiteConfirm();
    expect(function(){tillReceipt.customerPayment(2.00)}).toThrow(new Error("This amount does not cover the bill"));
  });

  it('lets you add multiple amounts of the same item to the order', function() {
    tillReceipt.addToOrder('Cafe Latte', 2);
    expect(tillReceipt.orderItemsWithPrices).toEqual([{'Cafe Latte': 4.75 },{'Cafe Latte': 4.75 }]);
  });

  it('adds a 5% discount on orders over £50', function() {
    tillReceipt.addToOrder('Cafe Latte', 11);
    tillReceipt.confirmOrder();
    expect(tillReceipt.confirmedPostTaxOrderTotal).toEqual(53.93);
  });

  it('adds a 10% discount to the order total if the hipster customer buys a muffin', function() {
    tillReceipt.addToOrder('Cafe Latte');
    tillReceipt.addToOrder('Blueberry Muffin');
    tillReceipt.confirmOrder();
    expect(tillReceipt.confirmedPostTaxOrderTotal).toEqual(8.60);
  });
});