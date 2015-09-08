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

    it('item from an order', function() {
      var itemList = {};
      till.compileItemList(itemList, 'Cafe Latte', 4.75, 2);
      expect(itemList['Cafe Latte']['price']).toEqual(4.75);
      expect(itemList['Cafe Latte']['quantity']).toEqual(2);
    });
  });

  describe('can calculate', function() {
    it('individual item total', function() {
      expect(till.calculateItemTotal(4.75, 3)).toEqual(14.25);
    });

    it('individual tax amount', function() {
      expect(till.calculateTax(14.25)).toEqual(1.23);
    });

    it('payment due if total is not covered', function() {
      expect(till.calculateChange(14.25, 14.00)).toEqual(-0.25);
    });

    it('change due if total is covered', function() {
      expect(till.calculateChange(14.25, 16.00)).toEqual(1.75);
    });

    it('total after muffin discount', function() {
      expect(till.applyMuffinDiscount(21.95, 0.86)).toEqual(21.09);
    });

    it('no 5% discount if order < $50', function() {
      expect(till.calculateFivepcDiscount(49.50)).toEqual(0);
    });

    it('no 5% discount if order = $50', function() {
      expect(till.calculateFivepcDiscount(50.00)).toEqual(0);
    });

    it('5% discount if order > $50', function() {
      expect(till.calculateFivepcDiscount(50.50)).toEqual(2.52);
    });

    it('total after 5% discount', function() {
      expect(till.applyFivepcDiscount(50.50, 2.52)).toEqual(47.98);
    });
  });

  describe('can set format', function() {
    it('to two decimal places', function() {
      expect(till.priceFormat(2.846352737)).toEqual(2.85);
    });
  });

});