describe("Till", function() {

  var till;

  var multiCoffee = function(){
    for ( i = 0; i < 5; i++ ) {
      till.addOrder('Cafe Latte');
    }
  };

  beforeEach(function(){
    till = new Till;
  });

  it('can store the customers names', function(){
    till.addCustomerName('Jane');
    expect(till.customersNames()).toEqual(['Jane']);
  });

  it('can store the table number', function(){
    till.addTableNumber(4);
    expect(till.tableNumber()).toEqual(4);
  });

  it('can add an item from the menu', function(){
    till.addOrder('Cafe Latte');
    expect(till.ordersList()).toEqual({'Cafe Latte': [ 1, 4.75 ]});
  });

  it('can have numerous of the same order', function(){
    multiCoffee();
    expect(till.ordersList()).toEqual({'Cafe Latte': [ 5, 4.75 ]})
  });

  it('can add up the bill', function(){
    multiCoffee();
    expect(till.subTotal()).toEqual(23.75);
  });

  it('can calculate the tax', function(){
    multiCoffee();
    expect(till.calculateTax()).toEqual(2.06);
  });

});
