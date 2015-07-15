describe('Till', function(){

  var till;
  var shopDetails;

  beforeEach(function() {
    till = new Till();
    shopDetails = loadDetailsSpec();
    till.shopName = shopDetails[0]['shopName'];
    till.address = shopDetails[0]['address'];
    till.phone = shopDetails[0]['phone'];
    till.menu = shopDetails[0]['prices'][0];
  });

  describe('can display', function() {
    it('shop name', function() {
      expect(till.shopName).toEqual('The Coffee Connection');
    });

    it('address', function() {
      expect(till.address).toEqual('123 Lakeside Way');
    });

    it('phone', function() {
      expect(till.phone).toEqual('16503600708');
    });

    it('price of an item', function() {
      expect(till.menu['Cafe Latte']).toEqual(4.75);
    });
  });

});