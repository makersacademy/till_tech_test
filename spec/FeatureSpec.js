describe('Features', function() {

  var till;
  var order;
  var arr;

  beforeEach(function() {
    till = new Till();
    order = new Order();
    arr = [
      {
        "Cafe Latte": 4.75,
        "Flat White": 4.75,
        "Cappucino": 3.85,
        "Single Espresso": 2.05,
        "Double Espresso": 3.75,
        "Americano": 3.75,
        "Cortado": 4.55,
        "Tea": 3.65,
        "Choc Mudcake": 6.40,
        "Choc Mousse": 8.20,
        "Affogato": 14.80,
        "Tiramisu": 11.40,
        "Blueberry Muffin": 4.05,
        "Chocolate Chip Muffin": 4.05,
        "Muffin Of The Day": 4.55
      }
    ];
    till.menu = toObject(arr)[0];
  });

  describe('till can display total of order', function() {
    it('1 x Cafe Latte', function() {
      order.addItem('Cafe Latte');
      expect(till.displayTotal(order)).toEqual(4.75);
    });


    // it('1 x Cafe Latte', function(done) {
    //   till.loadDetails().done(function() {
    //     order.addItem('Cafe Latte');
    //     expect(till.displayTotal(order)).toEqual(4.75);
    //     done();
    //   });
    // });

    // it('1 x Cafe Latte; 1 x Cappucino', function(done) {
    //   till.loadDetails().done(function() {
    //     order.addItem('Cafe Latte');
    //     order.addItem('Cappucino');
    //     expect(till.displayTotal(order)).toEqual(8.60);
    //     done();
    //   });
    // });

    // it('2 x Cafe Lattes; 1 x Cappucino', function(done) {
    //   till.loadDetails().done(function() {
    //     order.addItem('Cafe Latte');
    //     order.addItem('Cafe Latte');
    //     order.addItem('Cappucino');
    //     expect(till.displayTotal(order)).toEqual(13.35);
    //     done();
    //   });
    // });
  });

  describe('till can display tax amount of order', function() {
    it('1 x Cafe Latte', function(done) {
      till.loadDetails().done(function() {
        order.addItem('Cafe Latte');
        expect(till.displayTax(order)).toEqual(0.41);
        done();
      });
    });

    // it('1 x Cafe Latte; 1 x Cappucino', function(done) {
    //   till.loadDetails().done(function() {
    //     order.addItem('Cafe Latte');
    //     order.addItem('Cappucino');
    //     expect(till.displayTax(order)).toEqual(0.74);
    //     done();
    //   });
    // });

    // it('2 x Cafe Lattes; 1 x Cappucino', function(done) {
    //   till.loadDetails().done(function() {
    //     order.addItem('Cafe Latte');
    //     order.addItem('Cafe Latte');
    //     order.addItem('Cappucino');
    //     expect(till.displayTax(order)).toEqual(1.15);
    //     done();
    //   });
    // });
  });

  function toObject(arr) {
    var rv = {};
    for (var i = 0; i < arr.length; ++i)
      rv[i] = arr[i];
    return rv;
  }

});