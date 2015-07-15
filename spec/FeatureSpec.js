describe('Features', function() {

  var till;
  var order;

  beforeEach(function() {
    till = new Till();
    order = new Order();
  });

  describe('till can process order of', function() {
    it('1 x Cafe Latte and display total', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        expect(till.displayTotal(order)).toEqual(4.75);
        done();
      });
    });

    it('1 x Cafe Latte; 1 x Cappucino, and display total', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        order.addItem('Cappucino');
        expect(till.displayTotal(order)).toEqual(8.60);
        done();
      });
    });
  });

});