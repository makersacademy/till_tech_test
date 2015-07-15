describe ('Till', function(){
  var till;
  var details;

  beforeEach(function(){
    details = [
      {
        "shopName": "The Coffee Connection",
        "address": "123 Lakeside Way",
        "phone": "16503600708",
        "prices": [
          {
            "Cafe Latte": 4.75,
            "Flat White": 4.75,
            "Cappucino": 3.85,
            "Single Espresso": 2.05,
            "Double Espresso": 3.75,
          }
        ]
      }
    ];

    till = new Till(details);

  });

  it('has a total of 0 when initialised', function(){
    expect(till.total).toEqual(0);
  });

  it ('knows the exact date and time', function(){
    expect(till.date).toBeDefined();
  });

  it ('can calculate the total for one product', function(){
    till.calculateTotal("Cafe Latte", 1);
    expect(till.total).toEqual(4.75);
  });

  it ('can calculate the total for 2 products', function(){
    till.calculateTotal("Flat White", 1);
    till.calculateTotal("Cappucino", 1);
    expect(till.total).toEqual(8.6);
  });

  it ('can calculate the total 2 orders of the same product', function(){
    till.calculateTotal("Cappucino", 2);
    expect(till.total).toEqual(7.7);
  });

  it ('can calculate the total', function(){
    till.calculateTotal("Cappucino", 2);
    till.calculateTax();
    expect(till.total).toEqual(8.4);
  });

  it ('can show a list of ordered drinks', function(){
    till.calculateTotal("Cappucino", 2);
    till.calculateTotal("Flat White", 1);
    expect(till.receipt.length).toEqual(2);
  });

  it ('knows how much change to return the customer', function(){
    till.calculateTotal("Cappucino", 2);
    till.calculateTax();
    var note = 20;
    expect(till.calculateChange(note)).toEqual(11.6);
  });
});
