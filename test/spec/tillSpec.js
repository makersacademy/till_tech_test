describe ('Till', function(){
  var till;

  beforeEach(function(){
    till = new Till();

  });

  it('has a sum when initialised', function(){
    expect(till.sum).toEqual(0);
  });

  it ('knows the exact date and time', function(){
    expect(till.date).toBeDefined();
  });

  it ('can calculate the total for')
});

