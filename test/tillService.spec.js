'use strict';

describe('TillService', function() {

    beforeEach(module('CoffeeTill'));
 
	  var tillService;
	  beforeEach(inject(function(TillService) {
	    tillService = TillService;
	  }));

		var product = 'Muffin Of The Day';
		var price = 4.55;
		var order = {'Muffin Of The Day': [4.55,1,4.55]};

	beforeEach(function() {
		tillService.addNewItem(product, price);
	});

	it('initialises with an empty order total and tax amount', function() {
		expect(tillService.orderTotal).toBeUndefined();
		expect(tillService.taxAmount).toBeUndefined();
	});

	it('initialises with an empty object for order', function() {
		expect(tillService.order).toEqual(order); 
	});

	describe('calculate', function() {
		var quantity = 2;

		it('calculates the total product', function() {
			expect(tillService.calculate([price,quantity])).toEqual(Math.round((price * quantity)*100)/100);
		});
	});

	describe('addNewItem', function() {
		it('adds an item to order', function() {
			expect(tillService.order).toEqual(order);
		});
	});

	describe('addItem', function() {
		it('adds one to item quantity', function() {
			var order = {'Muffin Of The Day': [4.55,2, Math.round(9.10*100)/100]};
			tillService.addItem(product);
			expect(tillService.order).toEqual(order);
		});
	});

	describe('minusItem', function() {
		it('adds one to item quantity', function() {
			tillService.minusItem(product);
			expect(tillService.order).toEqual({});
		});
	});

	describe('removeItem', function() {
		it('removes a product', function() {
			tillService.removeItem(product);
			expect(tillService.order).toEqual({});
		});
	});

	describe('minusDiscount', function() {
		it('takes discount off total price', function() {
			for (var i = 0; i < 20; i++) {
				tillService.addItem(product);
			}
			tillService.addTotal();
			tillService.minusDiscount();
			expect(tillService.discount).toBeGreaterThan(price);
		});
	});

	describe('addTotal', function() {
		it('totals order', function() {
			tillService.addNewItem('Single Espresso', 2.05);
			tillService.addTotal();
			expect(tillService.totalPrice).toEqual(6.60);
		});
	});

	describe('calcTax', function() {
		it('calculates the amount of tax', function() {
			tillService.addTotal();
			tillService.calcTax();
			expect(tillService.tax).toEqual(price - price/1.0864);
		});
	});

});