describe('Features', function() {

  var till;
  var order;
  var shopDetails;

  beforeEach(function() {
    till = new Till();
    order = new Order();
    shopDetails = loadDetailsSpec();
    till.menu = shopDetails[0]['prices'][0];
  });

  describe('till can display item list of order', function() {
    it('1 x Cafe Latte', function() {
      order.addItem('Cafe Latte');
      var cafeLatte = till.produceOrderTotal(order)[0]['Cafe Latte'];
      expect(cafeLatte['price']).toEqual(4.75);
      expect(cafeLatte['quantity']).toEqual(1);
    });

    it('1 x Cafe Latte; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cappucino']);
      var cafeLatte = till.produceOrderTotal(order)[0]['Cafe Latte'];
      var cappucino = till.produceOrderTotal(order)[0]['Cappucino'];
      expect(cafeLatte['price']).toEqual(4.75);
      expect(cafeLatte['quantity']).toEqual(1);
      expect(cappucino['price']).toEqual(3.85);
      expect(cappucino['quantity']).toEqual(1);
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      var cafeLatte = till.produceOrderTotal(order)[0]['Cafe Latte'];
      var cappucino = till.produceOrderTotal(order)[0]['Cappucino'];
      expect(cafeLatte['price']).toEqual(4.75);
      expect(cafeLatte['quantity']).toEqual(2);
      expect(cappucino['price']).toEqual(3.85);
      expect(cappucino['quantity']).toEqual(1);
    });
  });

  describe('till can display total of order', function() {
    it('1 x Cafe Latte', function() {
      order.addItem('Cafe Latte');
      expect(till.produceOrderTotal(order)[1]).toEqual(4.75);
    });

    it('1 x Cafe Latte; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cappucino']);
      expect(till.produceOrderTotal(order)[1]).toEqual(8.60);
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      expect(till.produceOrderTotal(order)[1]).toEqual(13.35);
    });
  });

  describe('till can display tax amount of order', function() {
    it('1 x Cafe Latte', function() {
      order.addItem('Cafe Latte');
      total = till.produceOrderTotal(order)[1];
      expect(till.calculateTax(total)).toEqual(0.41);
    });

    it('1 x Cafe Latte; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cappucino']);
      total = till.produceOrderTotal(order)[1];
      expect(till.calculateTax(total)).toEqual(0.74);
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      total = till.produceOrderTotal(order)[1];
      expect(till.calculateTax(total)).toEqual(1.15);
    });
  });

  describe('till can calculate change due', function() {
    it('2 x Cafe Lattes; 1 x Cappucino - total not covered', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      total = till.produceOrderTotal(order)[1];
      expect(till.calculateChange(total, 12.00)).toEqual(-1.35);
    });

    it('2 x Cafe Lattes; 1 x Cappucino - total covered', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      total = till.produceOrderTotal(order)[1];
      expect(till.calculateChange(total, 15.00)).toEqual(1.65);
    });
  });

  describe('till can display 10% muffin discount', function() {
    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day']);
      var muffinDiscount = till.calculateMuffinDiscount(order)[0];
      var muffinTotal = till.calculateMuffinDiscount(order)[1];
      expect(muffinDiscount).toEqual(0.45);
      expect(muffinTotal).toEqual(4.55);
    });

    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day; 1 x Blueberry Muffin', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day', 'Blueberry Muffin']);
      var muffinDiscount = till.calculateMuffinDiscount(order)[0];
      var muffinTotal = till.calculateMuffinDiscount(order)[1];
      expect(muffinDiscount).toEqual(0.85);
      expect(muffinTotal).toEqual(8.60);
    });

    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day; 2 x Blueberry Muffins', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day', 'Blueberry Muffin', 'Blueberry Muffin']);
      var muffinDiscount = till.calculateMuffinDiscount(order)[0];
      var muffinTotal = till.calculateMuffinDiscount(order)[1];
      expect(muffinDiscount).toEqual(1.26);
      expect(muffinTotal).toEqual(12.65);
    });
  });

  describe('till can display total after 10% muffin discount', function() {
    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day']);
      total = till.produceOrderTotal(order)[1];
      muffinDiscount = till.calculateMuffinDiscount(order)[0];
      expect(till.applyMuffinDiscount(total, muffinDiscount)).toEqual(17.45);
    });

    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day; 1 x Blueberry Muffin', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day', 'Blueberry Muffin']);
      total = till.produceOrderTotal(order)[1];
      muffinDiscount = till.calculateMuffinDiscount(order)[0];
      expect(till.applyMuffinDiscount(total, muffinDiscount)).toEqual(21.10);
    });

    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day; 2 x Blueberry Muffins', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day', 'Blueberry Muffin', 'Blueberry Muffin']);
      total = till.produceOrderTotal(order)[1];
      muffinDiscount = till.calculateMuffinDiscount(order)[0];
      expect(till.applyMuffinDiscount(total, muffinDiscount)).toEqual(24.74);
    });
  });

  describe('till will not apply 10% muffin discount to uneligible orders', function() {
    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Choc Mudcake', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Choc Mudcake']);
      total = till.produceOrderTotal(order)[1];
      muffinDiscount = till.calculateMuffinDiscount(order)[0];
      expect(till.applyMuffinDiscount(total, muffinDiscount)).toEqual(19.75);
    });
  });

  describe('till can display total after order>$50 5% discount', function() {
    it('4 x Affogato', function() {
      addItems(order, ['Affogato', 'Affogato', 'Affogato', 'Affogato']);
      total = till.produceOrderTotal(order)[1];
      fivepcDiscount = till.calculateFivepcDiscount(total);
      expect(till.applyFivepcDiscount(total, fivepcDiscount)).toEqual(56.24);
    });
  });

  describe('till will not apply order>$50 5% discount to uneligible orders', function() {
    it('3 x Affogato', function() {
      addItems(order, ['Affogato', 'Affogato', 'Affogato']);
      total = till.produceOrderTotal(order)[1];
      fivepcDiscount = till.calculateFivepcDiscount(total);
      expect(till.applyFivepcDiscount(total, fivepcDiscount)).toEqual(44.40);
    });
  });

  describe('till can display total after order>$50 5% and 10% muffin discounts', function() {
    it('4 x Affogato; 1 x Bluberry Muffin', function() {
      addItems(order, ['Affogato', 'Affogato', 'Affogato', 'Affogato', 'Blueberry Muffin']);
      total = till.produceOrderTotal(order)[1];
      muffinDiscount = till.calculateMuffinDiscount(order)[0];
      total = till.applyMuffinDiscount(total, muffinDiscount);
      fivepcDiscount = till.calculateFivepcDiscount(total);
      total = till.applyFivepcDiscount(total, fivepcDiscount);
      expect(total).toEqual(59.71);
    });
  });

  describe('till will not apply order>$50 5% discount if 10% muffin discount reduces total to < $50', function() {
    it('11 x Muffin Of The Day', function() {
      addItems(order, ['Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day', 'Muffin Of The Day']);
      total = till.produceOrderTotal(order)[1];
      muffinDiscount = till.calculateMuffinDiscount(order)[0];
      total = till.applyMuffinDiscount(total, muffinDiscount);
      fivepcDiscount = till.calculateFivepcDiscount(total);
      total = till.applyFivepcDiscount(total, fivepcDiscount);
      expect(total).toEqual(45.05);
    });
  });

});