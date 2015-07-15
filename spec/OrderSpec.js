describe('Order', function(){

  var order;

  beforeEach(function() {
    order = new Order();
  });

  describe('has a default', function() {
    it('empty order', function() {
      expect(order.items).toEqual({});
    });
  });

  describe('can add to order', function() {
    it('1 x Cafe Latte and display quantity', function() {
      order.addItem('Cafe Latte');
      expect(order.items['Cafe Latte']).toEqual(1);
    });

    it('2 x Cafe Lattes and display quantity', function() {
      order.addItem('Cafe Latte');
      order.addItem('Cafe Latte');
      expect(order.items['Cafe Latte']).toEqual(2);
    });

  });

});