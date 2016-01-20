'use strict';
tillSystem.controller('TillController', ['$http', 'TillService', function($http, TillService) {
	var self = this;
 	self.tillService = TillService;
 	self.order = self.tillService.order;
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

	self.addSelection = function(item, price) {
		self.tillService.addNewItem(item,price);
	};

	self.addOne = function(key) {
		self.tillService.addItem(key);
	};

	self.minusOne = function(key) {
		self.tillService.minusItem(key);
	};

	self.update = function() {
		self.tillService.minusDiscount();
		self.tillService.addTotal();
		self.tillService.calcTax();
		self.updateVariables();
	};

	self.updateVariables = function() {
		self.discount = self.tillService.discount;
	  self.totalPrice = self.tillService.totalPrice;
	 	self.tax = self.tillService.tax;
	};

	self.complete = function() {
		self.update();
		self.change = self.tillService.calcChange(self.cash);
	};

}]);