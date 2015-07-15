describe('Features', function() {

  var till;
  var order;

  beforeEach(function() {
    till = new Till();
    order = new Order();
  });

  describe('till can display total of order', function() {
    it('1 x Cafe Latte', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        expect(till.displayTotal(order)).toEqual(4.75);
        done();
      });
    });

    it('1 x Cafe Latte; 1 x Cappucino', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        order.addItem('Cappucino');
        expect(till.displayTotal(order)).toEqual(8.60);
        done();
      });
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        order.addItem('Cafe Latte');
        order.addItem('Cappucino');
        expect(till.displayTotal(order)).toEqual(13.35);
        done();
      });
    });
  });

  describe('till can display tax amount of order', function() {
    it('1 x Cafe Latte', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        expect(till.displayTax(order)).toEqual(0.41);
        done();
      });
    });

    it('1 x Cafe Latte; 1 x Cappucino', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        order.addItem('Cappucino');
        expect(till.displayTax(order)).toEqual(0.74);
        done();
      });
    });

    it('2 x Cafe Lattes; 1 x Cappucino', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        order.addItem('Cafe Latte');
        order.addItem('Cappucino');
        expect(till.displayTax(order)).toEqual(1.15);
        done();
      });
    });
  });

});