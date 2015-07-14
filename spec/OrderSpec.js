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

});