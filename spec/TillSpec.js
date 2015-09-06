describe('Till', function() {
  var till;

  describe('gives the price of a', function() {

    it('Cafe Latte as 4.75', function(){
      till = new Till();
      expect(till.retrievePrice('Cafe Latte')).toEqual(4.75);
    });

    it('Blueberry Muffin as 4.05', function(){
      till = new Till();
      expect(till.retrievePrice('Blueberry Muffin')).toEqual(4.05);
    });
  });
});
