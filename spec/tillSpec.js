describe('Till', function(){

  var till = new Till();

  it('produces a receipt with a list of items bought', function(){

    till.ring("Cafe Latte");
    till.ring("Flat White");

    expect(till.receipt).toContain('Cafe Latte');
    expect(till.receipt).toContain('Flat White');

  });

  it('produces a line total with items', function(){

    till.ring("Cafe Latte");

    expect(till.receipt).toContain(4.75);

  });

})