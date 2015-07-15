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
            "Blueberry Muffin": 4.05
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
    till.calculateTotal("Cafe Latte", 1);
    expect(till.total).toEqual(9.5);
  });

  it ('can calculate the total 2 orders of the same product', function(){
    till.calculateTotal("Cappucino", 2);
    expect(till.total).toEqual(7.7);
  });

  it ('can calculate the taxes on the total', function(){
    till.calculateTotal("Cappucino", 2);
    till.calculateTaxes();
    expect(till.taxes).toEqual(0.67);
  });

  it ('can show a list of ordered drinks', function(){
    till.calculateTotal("Cappucino", 2);
    till.calculateTotal("Flat White", 1);
    expect(till.receipt.length).toEqual(2);
  });

  it ('knows how much change to return the customer', function(){
    till.calculateTotal("Cappucino", 2);
    var note = 20;
    expect(till.calculateChange(note)).toEqual(12.3);
  });

  it ('can apply a discount for orders over $50', function(){
    till.calculateTotal("Flat White", 11);
    expect(till.total).toEqual(49.64);
  });

  it ('can apply a discount to specific items (muffins)', function() {
    till.calculateTotal("Blueberry Muffin", 2)
    expect(till.total).toEqual(7.28);
  });

  it ('can apply a discount to specific items (muffins) and for orders over $50', function() {
    till.calculateTotal("Blueberry Muffin", 2)
    till.calculateTotal("Flat White", 5)
    till.calculateTotal("Double Espresso", 7)
    expect(till.total).toEqual(54.42);
  });





























});
