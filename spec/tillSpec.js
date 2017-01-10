describe("Till", function() {

  var till;

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
  })

  it('can add an item from the menu', function(){
    till.addOrder('Cafe Latte');
    expect(till.ordersList()).toEqual({'Cafe Latte': [ 1, 4.75 ]});
  })

  it('can have numerous of the same order', function(){
    for ( i = 0; i < 5; i++ ) {
      till.addOrder('Cafe Latte');
    }
    expect(till.ordersList()).toEqual({'Cafe Latte': [ 5, 4.75 ]})
  });

});
