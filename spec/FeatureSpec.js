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
      var cafeLatte = till.produceReceipt(order)[0]['Cafe Latte'];
      expect(cafeLatte['price']).toEqual(4.75);
      expect(cafeLatte['quantity']).toEqual(1);
    });

    it('1 x Cafe Latte; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cappucino']);
      var cafeLatte = till.produceReceipt(order)[0]['Cafe Latte'];
      var cappucino = till.produceReceipt(order)[0]['Cappucino'];
      expect(cafeLatte['price']).toEqual(4.75);
      expect(cafeLatte['quantity']).toEqual(1);
      expect(cappucino['price']).toEqual(3.85);
      expect(cappucino['quantity']).toEqual(1);
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      var cafeLatte = till.produceReceipt(order)[0]['Cafe Latte'];
      var cappucino = till.produceReceipt(order)[0]['Cappucino'];
      expect(cafeLatte['price']).toEqual(4.75);
      expect(cafeLatte['quantity']).toEqual(2);
      expect(cappucino['price']).toEqual(3.85);
      expect(cappucino['quantity']).toEqual(1);
    });
  });

  describe('till can display total of order', function() {
    it('1 x Cafe Latte', function() {
      order.addItem('Cafe Latte');
      expect(till.produceReceipt(order)[1]).toEqual(4.75);
    });

    it('1 x Cafe Latte; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cappucino']);
      expect(till.produceReceipt(order)[1]).toEqual(8.60);
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      expect(till.produceReceipt(order)[1]).toEqual(13.35);
    });
  });

  describe('till can display tax amount of order', function() {
    it('1 x Cafe Latte', function() {
      order.addItem('Cafe Latte');
      expect(till.produceReceipt(order)[2]).toEqual(0.41);
    });

    it('1 x Cafe Latte; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cappucino']);
      expect(till.produceReceipt(order)[2]).toEqual(0.74);
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      expect(till.produceReceipt(order)[2]).toEqual(1.15);
    });
  });

  describe('till can calculate change due', function() {
    it('2 x Cafe Lattes; 1 x Cappucino - total not covered', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      total = till.produceReceipt(order)[1];
      expect(till.calculateChange(total, 12.00)).toEqual(-1.35);
    });

    it('2 x Cafe Lattes; 1 x Cappucino - total covered', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      total = till.produceReceipt(order)[1];
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
      expect(till.produceReceipt(order)[1]).toEqual(17.45);
    });

    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day; 1 x Blueberry Muffin', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day', 'Blueberry Muffin']);
      expect(till.produceReceipt(order)[1]).toEqual(21.10);
    });

    it('2 x Cafe Lattes; 1 x Cappucino; 1 x Muffin Of The Day; 2 x Blueberry Muffins', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino', 'Muffin Of The Day', 'Blueberry Muffin', 'Blueberry Muffin']);
      expect(till.produceReceipt(order)[1]).toEqual(24.74);
    });
  });

});