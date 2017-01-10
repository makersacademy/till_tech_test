describe("Till", function() {

  var till;

  var multiCoffee = function(){
    for ( i = 0; i < 5; i++ ) {
      till.addOrder('Cafe Latte');
    }
    till.addCustomerName('Jane');
    till.addTableNumber(4);
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
    expect(till.listOrders()).toEqual({'Cafe Latte': [ 1, 4.75 ]});
  });

  it('can have numerous of the same order', function(){
    multiCoffee();
    expect(till.listOrders()).toEqual({'Cafe Latte': [ 5, 4.75 ]})
  });

  it('can add up the bill', function(){
    multiCoffee();
    expect(till.subTotal()).toEqual(23.75);
  });

  it('can calculate the tax', function(){
    multiCoffee();
    expect(till.calculateTax()).toEqual(2.06);
  });

  it('can output a receipt', function(){
    multiCoffee();
    expect(till.printReceipt()).toEqual(
      { "shopName": "The Coffee Connection",
        "address": "123 Lakeside Way",
        "phone": "16503600708",
        "customer": ["Jane"],
        "table": 4,
        "orders": { 'Cafe Latte': [ 5, 4.75 ] },
        "taxRate": 8.64,
        "tax": 2.06,
        "total": 23.75
      });
  });

});
