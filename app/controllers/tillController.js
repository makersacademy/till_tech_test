'use strict';
tillSystem.controller('TillController', ['$http', function($http) {
	var self = this;
	self.order = {};
 	self.fiftyDiscount = 0;
 	self.totalPrice = 0;
 	self.tax = 0;
 	self.activeTab = 1;

	$http.get('./../../hipstercoffee.json')
   	.success(function (data) {
       self.coffeeShopInfo  = data;
   	});

  self.setTab = function(tab) {
    self.activeTab = tab;
  };

  self.isActive = function(tab) {
    return (self.activeTab === tab);
  };

	self.calculate = function(item) {
		return Math.round((item[0] * item[1])*100)/100;
	};

	self.addCurrentSelection = function(item, price) {
		self.order[item] = [price, 1, price];
	};

	self.addOne = function(key) {
		self.order[key][1] += 1;
		self.order[key][2] = self.calculate(self.order[key]);
	};

	self.minusOne = function(key) {
		self.order[key][1] -= 1;
		if (self.order[key][1] === 0) {
			self.remove(key);
		} else {
			self.order[key][2] = self.calculate(self.order[key]);
		}
	};

	self.remove = function(key) {
		self.order[key] = null;
		delete self.order[key];
	};

	self.update = function() {
		self.minusDiscount();
		self.addTotal();
		self.calcTax();
	};

	self.addTotal = function() {
		var total = 0;
		var values=[];
		for( var key in self.order ) {
			total += (self.order[key][2]);
		}
		self.totalPrice = Math.round(total*100)/100 ;
	};

	self.minusDiscount = function() {
		if (self.totalPrice > 50.00) {
			self.fiftyDiscount = Math.round(self.totalPrice * 0.05*100)/100;
			self.totalPrice *= 0.95; 
		}
	};

	self.calcTax = function() {
		self.tax = self.totalPrice - self.totalPrice / 1.0864;
	};

	self.calcChange = function() {
		self.change = self.cash - self.totalPrice
	};
		
}]);