'use strict';

describe('TillController', function() {
	beforeEach(module('CoffeeTill'));

	var ctrl;
	var product = 'Muffin Of The Day';
	var price = 4.55;
	var order = {'Muffin Of The Day': [4.55,1,4.55]};

	beforeEach(inject(function($controller) {
		ctrl = $controller('TillController');
	}));

	beforeEach(function() {
		ctrl.addCurrentSelection(product, price);
	});

	it('initialises with an empty order total and tax amount', function() {
		expect(ctrl.orderTotal).toBeUndefined();
		expect(ctrl.taxAmount).toBeUndefined();
	});

	it('initialises with an empty object for order', function() {
		expect(ctrl.order).toEqual(order); 
	});

	describe('calculate', function() {

		var quantity = 2;

		it('calculates the total product', function() {
			expect(ctrl.calculate([price,quantity])).toEqual(Math.round((price * quantity)*100)/100);
		});
	});

	describe('addCurrentSelection', function() {
		it('adds an item to order', function() {
			expect(ctrl.order).toEqual(order);
		});
	});

	describe('addOne', function() {
		it('adds one to item quantity', function() {
			var order = {'Muffin Of The Day': [4.55,2, Math.round(9.10*100)/100]};
			ctrl.addOne(product);
			expect(ctrl.order).toEqual(order);
		});
	});

	describe('minusOne', function() {
		it('adds one to item quantity', function() {
			ctrl.minusOne(product);
			expect(ctrl.order).toEqual({});
		});
	});

	describe('remove', function() {
		it('removes a product', function() {
			ctrl.remove(product);
			expect(ctrl.order).toEqual({});
		});
	});

	// describe('update', function() {
	// 	it('calls ', function() {
	// 		ctrl.update();
	// 		expect(ctrl.minusDiscount()).toHaveBeenCalled();
	// 		expect(ctrl.addTotal()).toHaveBeenCalled();
	// 		expect(ctrl.calcTax()).toHaveBeenCalled();
	// 	});
	// });

	// describe('minusDiscount', function() {
	// 	it('takes discount off total price', function() {
	// 		for (var i = 0; i < 20; i++) {
	// 			ctrl.addOne(product);
	// 		}
	// 		ctrl.addTotal();
	// 		ctrl.minusDiscount();
	// 		expect(ctrl.fiftyDiscount).toEqual(price);
	// 	});
	// });

	describe('addTotal', function() {
		it('totals order', function() {
			ctrl.addCurrentSelection('Single Espresso', 2.05);
			ctrl.addTotal();
			expect(ctrl.totalPrice).toEqual(6.60);
		});
	});

	describe('calcTax', function() {
		it('calculates the amount of tax', function() {
			ctrl.addTotal();
			ctrl.calcTax();
			expect(ctrl.tax).toEqual(price - price/1.0864);
		});
	});

});