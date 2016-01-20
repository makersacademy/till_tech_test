'use strict';

describe('TillController', function() {
	beforeEach(module('CoffeeTill'));

	var ctrl;
	var tillService;
	var product = 'Muffin Of The Day';
	var price = 4.55;

	beforeEach(inject(function($controller) {
		ctrl = $controller('TillController');

		tillService = {
      addNewItem : function() {},
      addItem : function() {},
      minusItem : function() {},
      minusDiscount : function() {},
      addTotal : function() {},
      calcTax : function() {},
      calcChange : function() {}
    };

    spyOn(ctrl.tillService, 'addNewItem');
    spyOn(ctrl.tillService, 'addItem');
    spyOn(ctrl.tillService, 'minusItem');
    spyOn(ctrl.tillService, 'minusDiscount');
    spyOn(ctrl.tillService, 'addTotal');
    spyOn(ctrl.tillService, 'calcTax');
    spyOn(ctrl.tillService, 'calcChange');
  }));

	describe('setTab', function() {
		it('sets the tab', function() {
			ctrl.setTab(2);
			expect(ctrl.activeTab).toEqual(2);
		});
	});

	describe('isActive', function() {
    it('when active tab is equal to the input', function() {
      expect(ctrl.isActive(1)).toBeTruthy();
    });
    it('when active tab is not equal to the input', function() {
      expect(ctrl.isActive(2)).toBeFalsy();
    });
	});

	describe('addSelection', function() {
		it('adds an item to order', function() {
			ctrl.addSelection(product, price);
			expect(ctrl.tillService.addNewItem).toHaveBeenCalled();
		});
	});

	describe('addOne', function() {
		it('adds one to item quantity', function() {
			ctrl.addOne(product);
			expect(ctrl.tillService.addItem).toHaveBeenCalled();
		});
	});

	describe('minusOne', function() {
		it('adds one to item quantity', function() {
			ctrl.minusOne(product);
			expect(ctrl.tillService.minusItem).toHaveBeenCalled();
		});
	});

	describe('update', function() {
		it('calls', function() {
			ctrl.update();
			expect(ctrl.tillService.minusDiscount).toHaveBeenCalled();
			expect(ctrl.tillService.addTotal).toHaveBeenCalled();
			expect(ctrl.tillService.calcTax).toHaveBeenCalled();
		});
	});

	describe('complete', function() {
		it('calls', function() {
			ctrl.complete();
			expect(ctrl.tillService.calcChange).toHaveBeenCalled();
		});
	});

});