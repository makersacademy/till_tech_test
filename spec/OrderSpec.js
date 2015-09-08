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

    it('1 x Cafe Latte; 1 x Cappucino and display quantity', function() {
      addItems(order, ['Cafe Latte', 'Cappucino']);
      expect(order.items['Cafe Latte']).toEqual(1);
      expect(order.items['Cappucino']).toEqual(1);
    });

    it('2 x Cafe Lattes; 1 x Cappucino and display quantity', function() {
      addItems(order, ['Cafe Latte', 'Cafe Latte', 'Cappucino']);
      expect(order.items['Cafe Latte']).toEqual(2);
      expect(order.items['Cappucino']).toEqual(1);
    });
  });

});