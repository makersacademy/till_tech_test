describe('Till', function(){

  beforeEach(function() {
    till = new Till();
  });

  describe('has a default', function() {
    it('total of 0', function() {
      expect(till.total).toBe(0);
    });

    it('empty order', function() {
      expect(till.order).toEqual([]);
    });
  });

  // describe('can add to order', function() {
  //   it('1 x Cafe Latte', function() {
  //     till.addItem('Cafe Latte');
  //     expect(till.callTotal()).toEqual(4.75);
  //   });
  // });

});