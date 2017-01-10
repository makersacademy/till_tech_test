describe("Till", function() {

  var till;

  beforeEach(function(){
    till = new Till;
  });

  it('can store the customers names', function(){
    till.addCustomerName('Jane');
    expect(till.customersNames()).toEqual(['Jane']);
  });

});
