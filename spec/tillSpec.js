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

      expect(till.receipt.tax).toEqual(1.68);
      expect(till.receipt.totalCost).toEqual(21.18);
    })
  })

  describe('handling payment', function(){

    it('can receive payment', function(){

      expect(till.receivePayment).toBeDefined();

    })

    it('can calculate change', function(){

      till.ring('Tiramisu');
      till.ring('Blueberry Muffin', 2);

      till.calculateTax();

      expect(till.receipt.totalCost).toEqual(21.18);

      till.receivePayment(25);

      expect(till.receipt.change).toEqual(3.82);

    });

    it('gives discounts on purchases over 30', function(){

      till.ring('Tiramisu', 3);

      expect(till.receipt.discount).toEqual('5% discount for purchases over 30');

      expect(till.receipt.totalCost).toEqual(32.49);

    })


  })

})