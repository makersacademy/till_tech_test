describe('Till', function(){

  var till;

  beforeEach(function() {
    till = new Till();
  });

  describe('can display', function() {
    it('the shop name', function(done) {
      till.loadDetails().done(function() {
        expect(till.shopName).toEqual('The Coffee Connection');
        done();
      });
    });

    it('the address', function(done) {
      till.loadDetails().done(function() {
        expect(till.address).toEqual('123 Lakeside Way');
        done();
      });
    });

    it('the phone number', function(done) {
      till.loadDetails().done(function() {
        expect(till.phone).toEqual('16503600708');
        done();
      });
    });
  });

});