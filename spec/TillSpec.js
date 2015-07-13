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

});