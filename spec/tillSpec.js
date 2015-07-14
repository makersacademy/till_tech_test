describe('Till', function(){

  beforeEach(function(){
    till = new Till();
  });

  describe('list of items on receipt', function(){

      it('produces a receipt with a list of items bought', function(){

      till.ring('Cafe Latte');
      till.ring('Flat White');

      expect(Object.keys(till.receipt)).toContain('Cafe Latte');
      //turns receipt object into an array that toContain can be called on

    });

      it('produces a line total with items', function(){

      till.ring('Tea', 2);

      expect(till.receipt.Tea).toEqual('2 x 3.65')

    });

  });

  describe('total cost', function(){

    it('calculates the total cost of all items', function(){

      till.ring('Chocolate Chip Muffin', 2);
      till.ring('Tea');

      expect(till.receipt.totalCost).toEqual(11.75);
    })

  })

  describe('tax', function(){

    it('calculates amount to be paid in tax ', function(){

      till.ring('Tiramisu');
      till.ring('Blueberry Muffin', 2);

      till.calculateTax();

      expect(till.receipt.tax).toEqual(1.6848);
    })
  })

})