describe('Till', function() {
  var till;

  describe('gives the price of', function() {

    it('a Cafe Latte as 4.75', function(){
      till = new Till();
      expect(till.retrievePrice('Cafe Latte')).toEqual(4.75);
    });

    it('a Blueberry Muffin as 4.05', function(){
      till = new Till();
      expect(till.retrievePrice('Blueberry Muffin')).toEqual(4.05);
    });
  });

  describe('calculates the total price of', function() {
    it('a Cafe Latte and a Blueberry Muffin', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      till.addItem('Blueberry Muffin')
      expect(till.calculateSubTotal()).toEqual(8.80);
    });

    it('two Cafe Lattes', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      till.addItem('Cafe Latte');
      expect(till.calculateSubTotal()).toEqual(9.50);
    });
  });

  describe('calculates tax as', function() {
    it('£8.64 on an order totalling £100', function() {
      till = new Till();
      expect(till.calculateTax(100.00)).toEqual(8.64);
    });

    it('£5.64 on an order totalling £65.30', function() {
      till = new Till();
      expect(till.calculateTax(65.30)).toEqual(5.64);
    });
  });

  describe('knows which items have been ordered', function() {
    it('contains ["Cafe Latte"] when Cafe Latte ordered', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      expect(till.orderedItems).toEqual(['Cafe Latte']);
    });

    it('contains ["Cafe Latte", "Cafe Latte"] when Cafe Latte ordered twice', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      expect(till.orderedItems).toEqual(['Cafe Latte']);
    });
  });

  describe('gives the correct line totals', function() {
    it('of one Cafe Latte', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      expect(till.printOrder()).toEqual({ 'Cafe Latte': 1 });
    });

    it('of two Cafe Lattes', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      till.addItem('Cafe Latte');
      expect(till.printOrder()).toEqual({ 'Cafe Latte': 2 });
    });

    it('of two Cafe Lattes and a Cortado', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      till.addItem('Cafe Latte');
      till.addItem('Cortado');
      expect(till.printOrder()).toEqual({ 'Cafe Latte': 2, 'Cortado': 1 });
    });
  });

  describe('taking a payment', function() {
    it('calculates correct change', function() {
      till = new Till();
      expect(till.calculateChange(10.00, 5.00)).toEqual(5.00);
    });

    it('raises error if cash amount less than order total', function() {
      till = new Till();
      expect(till.calculateChange(10.00, 11.00)).toEqual('Not enough cash given');
    });
  });
});
