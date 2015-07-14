describe('Till', function(){


  describe('first block', function(){

      var till = new Till();

      it('produces a receipt with a list of items bought', function(){

      till.ring('Cafe Latte');
      till.ring('Flat White');

      //expect(till.receipt).toHaveMember('Cafe Latte');

    });

  });

  describe('second block', function(){

      var till = new Till();

      it('produces a line total with items', function(){

      till.ring('Cafe Latte', 2);

      expect(till.receipt).toEqual({'Cafe Latte': '2 x 4.75'})

    });

  });

  describe('total cost', function(){

    var till = new Till();

    it('calculates the total cost of all items', function(){

      till.ring('Chocolate Chip Muffin', 2);
      till.ring('Tea');

      expect(till.totalCost).toEqual(11.75);
    })

  })

})