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

  describe('calculates the total price', function() {
    it('of a Cafe Latte and a Blueberry Muffin', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      till.addItem('Blueberry Muffin')
      expect(till.calculateTotal()).toEqual(8.80);
    });

    it('of two Cafe Lattes', function() {
      till = new Till();
      till.addItem('Cafe Latte');
      till.addItem('Cafe Latte');
      expect(till.calculateTotal()).toEqual(9.50);
    });
  });
});
