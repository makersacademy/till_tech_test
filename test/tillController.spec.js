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

	describe('setTab', function() {
		it('sets the tab', function() {
			ctrl.setTab(2);
			expect(ctrl.activeTab).toEqual(2);
		});
	});

	describe('isActive', function() {
    it('when active tab is equal to the input', function() {
      expect(ctrl.isActiveTab(1)).toBeTruthy();
    });
    it('when active tab is not equal to the input', function() {
      expect(ctrl.isActiveTab(2)).toBeFalsy();
    });
	});

	describe('addSelection', function() {
		it('adds an item to order', function() {
			ctrl.addOne(product, price);
			expect(ctrl.tillService.addNewItem()).toHaveBeenCalled().with(product, price)
		});
	});

	describe('addOne', function() {
		it('adds one to item quantity', function() {
			ctrl.addOne(product);
			expect(ctrl.tillService.addItem()).toHaveBeenCalled().with(product)
		});
	});

	describe('minusOne', function() {
		it('adds one to item quantity', function() {
			ctrl.minusOne(product);
			expect(ctrl.tillService.minusItem()).toHaveBeenCalled().with(product);
		});
	});

	describe('update', function() {
		it('calls', function() {
			ctrl.update();
			expect(ctrl.tillService.minusDiscount()).toHaveBeenCalled();
			expect(ctrl.tillService.addTotal()).toHaveBeenCalled();
			expect(ctrl.tillService.calcTax()).toHaveBeenCalled();
		});
	});

	describe('updateVariables', function() {
		it('calls', function() {
			ctrl.updateVariables();
			expect(ctrl.tillService.discount).toHaveBeenCalled();
			expect(ctrl.tillService.totalPrice).toHaveBeenCalled();
			expect(ctrl.tillService.tax).toHaveBeenCalled();
		});
	});

	describe('complete', function() {
		it('calls', function() {
			ctrl.complete();
			expect(ctrl.tillService.discount).toHaveBeenCalled();
			expect(ctrl.tillService.totalPrice).toHaveBeenCalled();
			expect(ctrl.tillService.tax).toHaveBeenCalled();
		});
	});


});