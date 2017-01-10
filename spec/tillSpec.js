describe("Till", function() {

  var till;

  beforeEach(function(){
    till = new Till;
    for ( i = 0; i < 5; i++ ) {
      till.addOrder('Cafe Latte');
    }
    till.addCustomerName('Jane');
    till.addTableNumber(4);
  });

  it('can store the customers names', function(){
    expect(till.customersNames()).toEqual(['Jane']);
  });

  it('can store the table number', function(){
    expect(till.tableNumber()).toEqual(4);
  });

  it('can add items from the menu', function(){
    expect(till.listOrders()).toEqual({'Cafe Latte': [ 5, 4.75 ]})
  });

  it('can add up the bill', function(){
    expect(till.subTotal()).toEqual(23.75);
  });

  it('can calculate the tax', function(){
    expect(till.calculateTax()).toEqual(2.06);
  });

  it('can output a receipt', function(){
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

  it('can take payment and calculate change', function(){
    expect(till.makePayment(25)).toEqual(1.25);
  });

  it('warns if not enough money is given', function(){
    expect(till.makePayment(20)).toEqual("Insufficent payment, the total is 23.75")
  })

});
