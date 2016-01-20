'use strict';

tillSystem.service('TillService', function() {
	var self = this;
	self.order = {};
 	self.discount = 0;
 	self.totalPrice = 0;
 	self.tax = 0;

	self.calculate = function(item) {
		return (item[0] * item[1]);
	};

	self.addNewItem = function(item, price) {
		self.order[item] = [price, 1, price];
	};

	self.addItem = function(key) {
		self.order[key][1] += 1;
		self.order[key][2] = self.calculate(self.order[key]);
	};

	self.minusItem = function(key) {
		self.order[key][1] -= 1;
		if (self.order[key][1] === 0) {
			self.removeItem(key);
		} else {
			self.order[key][2] = self.calculate(self.order[key]);
		}
	};

	self.removeItem = function(key) {
		self.order[key] = null;
		delete self.order[key];
	};

	self.addTotal = function() {
		var total = 0;
		var values=[];
		for( var key in self.order ) {
			total += (self.order[key][2]);
		}
		self.totalPrice = total;
	};

	self.minusDiscount = function() {
		if (self.totalPrice > 50.00) {
			self.discount = (self.totalPrice * 0.05);
			self.totalPrice *= 0.95; 
		}
	};

	self.calcTax = function() {
		self.tax = self.totalPrice - self.totalPrice / 1.0864;
	};

	self.calcChange = function(cash) {
		return (cash - self.totalPrice);
	};
		
});